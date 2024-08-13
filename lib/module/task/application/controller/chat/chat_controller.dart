import 'dart:async';

import 'package:bizkit/core/api_endpoints/socket_endpoints.dart';
import 'package:bizkit/module/biz_card/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/task/domain/model/chat/create_poll.dart';
import 'package:bizkit/module/task/domain/model/chat/message.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class ChatController extends GetxController {
  late IOWebSocketChannel channel;
  final TextEditingController controller = TextEditingController();
  final ScrollController chatScrollController = ScrollController();

  /// chat message list
  RxList<Message> messages = <Message>[].obs;
  String _error = '';
  String chatTaskId = '';
  bool firstLoad = true;

  /// connect to the channel with task id
  void connectChannel({required String? taskId}) async {
    chatTaskId = taskId ?? '';
    chatScrollController.addListener(
      () {
        checkLoading();
      },
    );
    final token = await SecureStorage.getToken();
    final accessToken = token.accessToken ?? '';
    final uid = token.uid ?? '';
    firstLoad = true;
    messages.clear();
    // remove when server is there.. for testing use it
    // messages = sampleMessages.obs;
    try {
      channel = IOWebSocketChannel.connect(
        Uri.parse(
            SocketEndpoints.taskChat.replaceFirst('{task_id}', taskId ?? '')),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      channel.stream.listen(
        (message) {
          print(message);
          final m = Message.fromJson(
              jsonDecode(message) as Map<String, dynamic>, uid);
          if (m.messageType == 'text' &&
              !messages.any((mess) => mess.messageId == m.messageId)) {
            messages.add(m);
          } else if (m.messageType == 'poll') {
            messages.add(m);
          }
          update(['chat']);
          Timer(
            const Duration(milliseconds: 200),
            () {
              chatScrollController.animateTo(
                  firstLoad
                      ? chatScrollController.position.maxScrollExtent
                      : chatScrollController.position.pixels +
                          (m.messageType == 'poll' ? 500 : 100),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
          );
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

  /// close channel connection
  void closeConnetion() {
    try {
      channel.sink.close();
      // channel.sink.close(status.goingAway);
    } catch (e) {
      print('Channel close error =>$e');
    }
  }

  /// send text message
  void sendTextMessage() {
    if (controller.text.isNotEmpty) {
      final message = controller.text;
      try {
        channel.sink
            .add(jsonEncode({"message_type": "text", "message": message}));
        controller.clear();
        firstLoad = false;
      } catch (e) {
        print('Failed to send message: $e');
        _error = 'Failed to send message: $e';
      }
    }
  }

  /// create poll voting
  void createPollVoting({required CreatePoll createPoll}) {
    try {
      channel.sink.add(jsonEncode(createPoll.toJson()));
      controller.clear();
      firstLoad = false;
    } catch (e) {
      print('Failed to create poll: $e');
      _error = 'Failed to create poll: $e';
    }
  }

  /// check for load more
  void checkLoading() {
    if (chatScrollController.offset ==
        chatScrollController.position.minScrollExtent) {
      print('call load more message');
      // channel.sink.add(jsonEncode({
      //   "message_type": "load_more",
      //   "last_message_id": messages.first.messageId
      // }));
    }
  }
}

final List<Message> sampleMessages = [
  Message(
    messageType: 'text',
    userId: 'user1',
    username: 'Alice',
    profilePicture: 'https://example.com/alice.jpg',
    timestamp: '2024-08-09T10:15:00Z',
    messageId: 'msg1',
    message: 'Hey there!',
    sender: true,
  ),
  Message(
    messageType: 'text',
    userId: 'user2',
    username: 'Bob',
    profilePicture: 'https://example.com/bob.jpg',
    timestamp: '2024-08-09T10:16:00Z',
    messageId: 'msg2',
    message: 'Hello Alice!',
    sender: false,
  ),
  Message(
    messageType: 'text',
    userId: 'user1',
    username: 'Alice',
    profilePicture: 'https://example.com/alice.jpg',
    timestamp: '2024-08-09T10:17:00Z',
    messageId: 'msg3',
    message: 'How are you today?',
    sender: true,
  ),
  Message(
    messageType: 'text',
    userId: 'user2',
    username: 'Bob',
    profilePicture: 'https://example.com/bob.jpg',
    timestamp: '2024-08-09T10:18:00Z',
    messageId: 'msg4',
    message: 'I\'m doing well, thanks!',
    sender: false,
  ),
  Message(
    messageType: 'text',
    userId: 'user1',
    username: 'Alice',
    profilePicture: 'https://example.com/alice.jpg',
    timestamp: '2024-08-09T10:19:00Z',
    messageId: 'msg5',
    message: 'Glad to hear that!',
    sender: true,
  ),
  Message(
    messageType: 'text',
    userId: 'user1',
    username: 'Alice',
    profilePicture: 'https://example.com/alice.jpg',
    timestamp: '2024-08-09T10:15:00Z',
    messageId: 'msg1',
    message: 'Hey there!',
    sender: true,
  ),
  Message(
    messageType: 'text',
    userId: 'user2',
    username: 'Bob',
    profilePicture: 'https://example.com/bob.jpg',
    timestamp: '2024-08-09T10:16:00Z',
    messageId: 'msg2',
    message: 'Hello Alice!',
    sender: false,
  ),
  Message(
    messageType: 'text',
    userId: 'user1',
    username: 'Alice',
    profilePicture: 'https://example.com/alice.jpg',
    timestamp: '2024-08-09T10:17:00Z',
    messageId: 'msg3',
    message: 'How are you today?',
    sender: true,
  ),
  Message(
    messageType: 'text',
    userId: 'user2',
    username: 'Bob',
    profilePicture: 'https://example.com/bob.jpg',
    timestamp: '2024-08-09T10:18:00Z',
    messageId: 'msg4',
    message: 'I\'m doing well, thanks!',
    sender: false,
  ),
  Message(
    messageType: 'text',
    userId: 'user1',
    username: 'Alice',
    profilePicture: 'https://example.com/alice.jpg',
    timestamp: '2024-08-09T10:19:00Z',
    messageId: 'msg5',
    message: 'Glad to hear that!',
    sender: true,
  ),
  Message(
    messageType: 'text',
    userId: 'user1',
    username: 'Alice',
    profilePicture: 'https://example.com/alice.jpg',
    timestamp: '2024-08-09T10:15:00Z',
    messageId: 'msg1',
    message: 'Hey there!',
    sender: true,
  ),
  Message(
    messageType: 'text',
    userId: 'user2',
    username: 'Bob',
    profilePicture: 'https://example.com/bob.jpg',
    timestamp: '2024-08-09T10:16:00Z',
    messageId: 'msg2',
    message: 'Hello Alice!',
    sender: false,
  ),
  Message(
    messageType: 'text',
    userId: 'user1',
    username: 'Alice',
    profilePicture: 'https://example.com/alice.jpg',
    timestamp: '2024-08-09T10:17:00Z',
    messageId: 'msg3',
    message: 'How are you today?',
    sender: true,
  ),
  Message(
    messageType: 'text',
    userId: 'user2',
    username: 'Bob',
    profilePicture: 'https://example.com/bob.jpg',
    timestamp: '2024-08-09T10:18:00Z',
    messageId: 'msg4',
    message: 'I\'m doing well, thanks!',
    sender: false,
  ),
  Message(
    messageType: 'text',
    userId: 'user1',
    username: 'Alice',
    profilePicture: 'https://example.com/alice.jpg',
    timestamp: '2024-08-09T10:19:00Z',
    messageId: 'msg5',
    message: 'Glad to hear that!',
    sender: true,
  ),
  Message(
    messageType: 'text',
    userId: 'user1',
    username: 'Alice',
    profilePicture: 'https://example.com/alice.jpg',
    timestamp: '2024-08-09T10:15:00Z',
    messageId: 'msg1',
    message: 'Hey there!',
    sender: true,
  ),
  Message(
    messageType: 'text',
    userId: 'user2',
    username: 'Bob',
    profilePicture: 'https://example.com/bob.jpg',
    timestamp: '2024-08-09T10:16:00Z',
    messageId: 'msg2',
    message: 'Hello Alice!',
    sender: false,
  ),
  Message(
    messageType: 'text',
    userId: 'user1',
    username: 'Alice',
    profilePicture: 'https://example.com/alice.jpg',
    timestamp: '2024-08-09T10:17:00Z',
    messageId: 'msg3',
    message: 'How are you today?',
    sender: true,
  ),
  Message(
    messageType: 'text',
    userId: 'user2',
    username: 'Bob',
    profilePicture: 'https://example.com/bob.jpg',
    timestamp: '2024-08-09T10:18:00Z',
    messageId: 'msg4',
    message: 'I\'m doing well, thanks!',
    sender: false,
  ),
  Message(
    messageType: 'text',
    userId: 'user2',
    username: 'Bob',
    profilePicture: 'https://example.com/bob.jpg',
    timestamp: '2024-08-09T10:18:00Z',
    messageId: 'msg4',
    message: 'I\'m doing well, thanks!',
    sender: false,
  ),
  Message(
    messageType: 'text',
    userId: 'user1',
    username: 'Alice',
    profilePicture: 'https://example.com/alice.jpg',
    timestamp: '2024-08-09T10:19:00Z',
    messageId: 'msg5',
    message: 'Glad to hear that!',
    sender: true,
  ),
];
