import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:bizkit/core/api_endpoints/socket_endpoints.dart';
import 'package:bizkit/module/task/domain/model/task_notifications/task_notifications.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/task/domain/model/chat/unread_count.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

class MessageCountController extends GetxController {
  @override
  onInit() {
    connectChannel();
    super.onInit();
  }

  late IOWebSocketChannel channel;
  String _error = '';
  RxBool viewed=false.obs;
  RxMap<String, RxInt> unreadCounts = <String, RxInt>{}.obs;

  RxList<TaskNotification> taskNotification = <TaskNotification>[].obs;

  void connectChannel() async {
    try {
      final token = await SecureStorage.getToken();
      final accessToken = token.accessToken ?? '';
      unreadCounts = <String, RxInt>{}.obs;
      taskNotification.value = [];

      channel = IOWebSocketChannel.connect(
        Uri.parse(SocketEndpoints.messageCount),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      channel.stream.listen(
        (data) {
          log('notification ==> $data');
          // print(
          //     'notification =======================> \n ${jsonDecode(data as String) as Map<String, dynamic>}');

          final decodedData =
              jsonDecode(data as String) as Map<String, dynamic>;
          if (decodedData.containsKey('notifications')) {
            for (var data in (decodedData['notifications'] as List<dynamic>)) {
              final index = taskNotification
                  .indexWhere((value) => value.id == data['_id']);
              final task =
                  TaskNotification.fromJson(data as Map<String, dynamic>);
              if (index == -1) {
                taskNotification.add(task);
                if (task.notificationType == 'task_viewed') {
                  Get.showSnackbar(GetSnackBar(
                    title: task.message,
                    message: task.message,
                    snackPosition: SnackPosition.TOP,
                  ));
                }
                viewed.value=true;
              } else {
                taskNotification[index] = task;
              }
            }
          } else if (decodedData.containsKey('unread_counts')) {
            final unread = UnreadCounts.fromJson(decodedData);
            for (var k in (unread.unreadCounts?.keys.toList()) ?? []) {
              unreadCounts[k] = (unread.unreadCounts?[k] ?? 0).obs;
            }
          }
        },
        onError: (error) {
          print('Connection error: $error');
          _error = 'Connection error: $error';
        },
        onDone: () {
          if (channel.closeCode != null) {
            print('Connection closed with code: ${channel.closeCode}');
            _error = 'Connection closed with code: ${channel.closeCode}';
          }
        },
      );
    } catch (e) {
      print('Failed to connect: $e');
      _error = 'Failed to connect: $e';
    }
  }

  clearNotification(List<String?> ids) {
    final data = {
      "message_type": "mark_notification_as_read",
      "notification_ids": ids,
    };
    addMessageToChannel(data: data);
    for (var id in ids) {
      taskNotification.removeWhere((value) => value.id == id);
    }
    for (var values in taskNotification) {
      log(values.id.toString());
    }
  }

  void addMessageToChannel({required Map<String, dynamic> data}) async {
    try {
      channel.sink.add(jsonEncode(data));
      print('successfull addmessage');
    } catch (e) {
      log('message sending error $e');
      rethrow;
    }
  }

  void closeConnetion() {
    try {
      channel.sink.close();
      // channel.sink.close(status.goingAway);
    } catch (e) {
      print('Channel close error =>$e');
    }
  }

  // call socket for the count of all unread messages
  void sendReqForUnread() {
    Timer(const Duration(seconds: 5), () {
      try {
        channel.sink.add(jsonEncode({"message_type": "unread_count"}));
      } catch (e) {
        print('Failed to call message count socket: $e');
        _error = 'Failed to call message count socket: $e';
      }
    });
  }

  // reset the count of the message while opening the chat
  void resetCount({required String id}) {
    if (id == '') return;
    unreadCounts[id] = 0.obs;
  }
}
