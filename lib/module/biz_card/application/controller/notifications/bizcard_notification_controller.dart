import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/core/api_endpoints/socket_endpoints.dart';
import 'package:bizkit/module/biz_card/domain/model/notifications/bizcard_notification/bizcard_notification.dart';
import 'package:bizkit/packages/sound/just_audio.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'package:web_socket_channel/io.dart';

class BizcardNotificationController extends GetxController {
  @override
  void onInit() {
    connectChannel();
    super.onInit();
  }

  late IOWebSocketChannel channel;

  String error = '';

  // Notification viewd
  RxBool viewed = false.obs;

  RxList<BizcardNotification> bizcardNotifications =
      <BizcardNotification>[].obs;

  final AudioPlayerHandler audioPlayerHandler = AudioPlayerHandler();

  // Connect channel
  void connectChannel() async {
    try {
      // Retrieve the access token from secure storage
      final token = await SecureStorage.getToken();
      final accessToken = token.accessToken ?? '';

      bizcardNotifications.value = [];

      channel = IOWebSocketChannel.connect(
        Uri.parse(SocketEndpoints.bizcardNotification),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      log('BIZCARD NOTIFICATIONS CONNECTED ====> ',
          name: ' BIZCARD NOTIFICATIONS');

      channel.stream.listen(
        (event) {
          log('BIZCARD NOTIFICATIONS ====> $event',
              name: ' BIZCARD NOTIFICATIONS');

          final decodedData =
              jsonDecode((event as String?) ?? '') as Map<String, dynamic>;

          if (decodedData.containsKey('notifications')) {
            for (var notification
                in (decodedData['notifications'] as List<dynamic>?) ?? []) {
              final index = bizcardNotifications.indexWhere(
                (value) => value.id == notification['_id'] as String?,
              );

              final bizcardNotification = BizcardNotification.fromJson(
                  (notification as Map<String, dynamic>?) ?? {});

              if (index == -1) {
                bizcardNotifications.add(bizcardNotification);
                viewed.value = true;
              } else {
                bizcardNotifications[index] = bizcardNotification;
              }
            }
          } else if (decodedData['type'] == 'bizcard_notification') {
            final message =
                decodedData['message'] ?? 'You have a new notification.';

            audioPlayerHandler.showNotificationWithSound(message);
          }
        },
        onError: (error) {
          log('Connection error: $error', name: 'bizcard notification');
          error = 'Connection error: $error';
        },
        onDone: () {
          if (channel.closeCode != null) {
            log('Connection closed with code: ${channel.closeCode}',
                name: 'bizcard notification');
            error = 'Connection closed with code: ${channel.closeCode}';
          }
        },
      );
    } catch (e) {
      log('Failed to connect $e', name: 'bizcard notification');
      error = 'Failed to connect $e';
    }
  }

  clearNotification(List<String?> ids) {
    final data = {
      "message_type": "mark_notification_as_read",
      "notification_ids": ids,
    };
    addMessageToChannel(data: data);
    for (var id in ids) {
      bizcardNotifications.removeWhere((value) => value.id == id);
    }
  }

  void addMessageToChannel({required Map<String, dynamic> data}) async {
    try {
      channel.sink.add(jsonEncode(data));
      log('addmessage successfully');
    } catch (e) {
      log('message sending error $e');
      rethrow;
    }
  }

  void closeConnection() {
    try {
      channel.sink.close();
    } catch (e) {
      log('Channel close error : $e', name: 'bizcard notification');
    }
  }
}
