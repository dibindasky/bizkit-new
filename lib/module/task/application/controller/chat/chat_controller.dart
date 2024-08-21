import 'dart:async';

import 'package:bizkit/core/api_endpoints/socket_endpoints.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/task/domain/model/chat/create_poll.dart';
import 'package:bizkit/module/task/domain/model/chat/message.dart';
import 'package:bizkit/module/task/domain/model/chat/poll.dart';
import 'package:bizkit/module/task/domain/model/chat/text_message.dart';
import 'package:bizkit/module/task/domain/model/chat/time_expence_creation.dart';
import 'package:bizkit/module/task/domain/model/chat/time_expence_message.dart';
import 'package:bizkit/module/task/domain/model/chat/vote_poll.dart';
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

  Rx<Poll> pollDetail = Poll().obs;

  /// connect to the channel with task id
  void connectChannel({required String? taskId}) async {
    chatTaskId = taskId ?? '';
    chatScrollController.addListener(() {
      checkLoading();
    });

    final token = await SecureStorage.getToken();
    final accessToken = token.accessToken ?? '';
    final uid = token.uid ?? '';
    firstLoad = true;
    messages.clear();

    try {
      print('message count taskId => $taskId');
      channel = IOWebSocketChannel.connect(
        Uri.parse(
            SocketEndpoints.taskChat.replaceFirst('{task_id}', taskId ?? '')),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      channel.stream.listen(
        (message) {
          // Decode the message from JSON
          final decodedMessage =
              jsonDecode(message as String) as Map<String, dynamic>;

          print(decodedMessage);
          bool doAnimate = true;
          // handle for text messages
          if (decodedMessage['message_type'] == 'text') {
            final m = TextMessage.fromJson(decodedMessage, uid);
            final mess = Message(textMessage: m, sender: m.sender);
            if (m.isLoadMore) {
              messages.insert(0, mess);
            } else if (!messages
                .any((mess) => mess.textMessage?.messageId == m.messageId)) {
              messages.add(mess);
            } else {
              doAnimate = false;
              print('message updation');
              final index = messages.indexWhere(
                  (element) => element.timeExpence?.messageId == m.messageId);
              if (index != -1) {
                messages[index] = mess;
              }
            }
          }
          // handle for polls
          else if (decodedMessage['message_type'] == 'poll') {
            final poll = Poll.fromJson(decodedMessage, uid);
            final mess = Message(poll: poll, sender: poll.sender);
            if (!messages.any((mess) => mess.poll?.pollId == poll.pollId)) {
              messages.add(mess);
            } else {
              doAnimate = false;
              print('poll updation');
              final index = messages
                  .indexWhere((element) => element.poll?.pollId == poll.pollId);
              if (index != -1) {
                messages[index] = mess;
                if (poll.pollId == pollDetail.value.pollId) {
                  pollDetail.value = poll;
                }
              }
            }
          }
          // handle for expence and time
          else if (decodedMessage['message_type'] == 'time_expense') {
            final m = TimeExpense.fromJson(decodedMessage, uid);
            final mess = Message(timeExpence: m, sender: m.sender);
            if (!messages
                .any((mess) => mess.textMessage?.messageId == m.messageId)) {
              messages.add(mess);
            } else {
              doAnimate = false;
              print('time expence updation');
              final index = messages.indexWhere(
                  (element) => element.timeExpence?.messageId == m.messageId);
              if (index != -1) {
                messages[index] = mess;
              }
            }
          }

          update(['chat']);
          if (decodedMessage['is_load_more'] != true && doAnimate) {
            Timer(
              const Duration(milliseconds: 200),
              () {
                chatScrollController.animateTo(
                  firstLoad
                      ? chatScrollController.position.maxScrollExtent
                      : chatScrollController.position.pixels +
                          (decodedMessage['message_type'] == 'poll'
                              ? 500
                              : 100),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
            );
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

  /// close channel connection
  void closeConnetion() {
    try {
      messages.clear();
      channel.sink.close();
      print('connection closed');
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

  /// add vote for pole
  void addVoteforPol({required VotePoll votePoll}) {
    try {
      channel.sink.add(jsonEncode(votePoll.toJson()));
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
      channel.sink.add(
        jsonEncode({
          "message_type": "load_more",
          "last_message_id": messages.first.textMessage != null
              ? (messages.first.textMessage!.messageId ?? '')
              : messages.first.poll != null
                  ? (messages.first.poll?.messageId ?? '')
                  : ''
        }),
      );
    }
  }

  // create time and expence chat
  void addTimeExpence({required TimeExpenseUpdation timeExpenceUpdation}) {
    try {
      channel.sink.add(jsonEncode(timeExpenceUpdation.toJson()));
    } catch (e) {
      print('Failed to update time and expence: $e');
      _error = 'Failed to update time and expence: $e';
    }
  }
}
