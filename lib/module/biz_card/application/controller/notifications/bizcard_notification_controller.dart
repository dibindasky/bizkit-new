import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/core/api_endpoints/socket_endpoints.dart';
import 'package:bizkit/module/biz_card/domain/model/notifications/bizcard_notification/bizcard_notification.dart';
import 'package:bizkit/packages/sound/just_audio.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/service/web_socket_service/web_socket_service.dart';
import 'package:get/get.dart';

class BizcardNotificationController extends GetxController {
  @override
  void onInit() {
    connectChannel();
    super.onInit();
  }

  late WebSocketService webSocketService;

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
      webSocketService = WebSocketService(SocketEndpoints.messageCount);

      webSocketService.connect(
        headers: {'Authorization': 'Bearer $accessToken'},
        listener: (event) {
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
        onErrors: (error) {
          log('Connection error: $error', name: 'bizcard notification');
          error = 'Connection error: $error';
        },
        onDones: () {
          if (webSocketService.channel?.closeCode != null) {
            log('Connection closed with code: ${webSocketService.channel?.closeCode}',
                name: 'bizcard notification');
            error =
                'Connection closed with code: ${webSocketService.channel?.closeCode}';
          }
        },
      );

      log('BIZCARD NOTIFICATIONS CONNECTED ====> ',
          name: ' BIZCARD NOTIFICATIONS');
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
      webSocketService.sendMessage(jsonEncode(data));
      log('addmessage successfully');
    } catch (e) {
      log('message sending error $e');
      rethrow;
    }
  }

  void closeConnection() {
    try {
      webSocketService.disconnect();
    } catch (e) {
      log('Channel close error : $e', name: 'bizcard notification');
    }
  }
}
