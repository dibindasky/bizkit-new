import 'dart:async';
import 'dart:convert';

import 'package:bizkit/core/api_endpoints/socket_endpoints.dart';
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
  RxMap<String, RxInt> unreadCounts = <String, RxInt>{}.obs;

  void connectChannel() async {
    try {
      final token = await SecureStorage.getToken();
      final accessToken = token.accessToken ?? '';
      unreadCounts = <String, RxInt>{}.obs;
 
      channel = IOWebSocketChannel.connect(
        Uri.parse(SocketEndpoints.messageCount),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      channel.stream.listen(
        (data) {
          final unread = UnreadCounts.fromJson(
              jsonDecode(data as String) as Map<String, dynamic>);
          for (var k in (unread.unreadCounts?.keys.toList()) ?? []) {
            unreadCounts[k] = (unread.unreadCounts?[k] ?? 0).obs;
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
