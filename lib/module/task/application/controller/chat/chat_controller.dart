import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/core/api_endpoints/socket_endpoints.dart';
import 'package:bizkit/module/task/domain/model/chat/current_location_message.dart';
import 'package:bizkit/module/task/domain/model/chat/file_model.dart';
import 'package:bizkit/packages/location/location_service.dart';
import 'package:bizkit/packages/pdf/pdf_picker.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/task/domain/model/chat/create_poll.dart';
import 'package:bizkit/module/task/domain/model/chat/message.dart';
import 'package:bizkit/module/task/domain/model/chat/poll.dart';
import 'package:bizkit/module/task/domain/model/chat/text_message.dart';
import 'package:bizkit/module/task/domain/model/chat/time_expence_creation.dart';
import 'package:bizkit/module/task/domain/model/chat/time_expence_message.dart';
import 'package:bizkit/module/task/domain/model/chat/vote_poll.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:bizkit/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

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

  /// connect to the channel with task id and handle the messages form the channel
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
            final mess = Message(
                textMessage: m, sender: m.sender, messageId: m.messageId);
            final index = messages.indexWhere(
                (element) => element.textMessage?.messageId == m.messageId);
            if (index != -1) {
              messages[index] = mess;
              doAnimate = false;
            } else if (m.isLoadMore) {
              messages.insert(0, mess);
              doAnimate = false;
            } else {
              messages.add(mess);
            }
          }

          // handle for file type
          if (decodedMessage['message_type'] == 'file') {
            final m = FileMessage.fromJson(decodedMessage, uid);
            final mess =
                Message(file: m, sender: m.sender, messageId: m.messageId);
            final index = messages.indexWhere(
                (element) => element.file?.messageId == m.messageId);
            if (index != -1) {
              messages[index] = mess;
              doAnimate = false;
            } else if (m.isLoadMore) {
              messages.insert(0, mess);
              doAnimate = false;
            } else {
              messages.add(mess);
            }
          }

          // handle for polls
          else if (decodedMessage['message_type'] == 'poll') {
            final m = Poll.fromJson(decodedMessage, uid);
            final mess =
                Message(poll: m, sender: m.sender, messageId: m.messageId);
            final index = messages.indexWhere(
                (element) => element.poll?.messageId == m.messageId);
            if (index != -1) {
              messages[index] = mess;
              doAnimate = false;
            } else if (m.isLoadMore) {
              messages.insert(0, mess);
              doAnimate = false;
            } else {
              messages.add(mess);
            }
          }

          // handle for expence and time
          else if (decodedMessage['message_type'] == 'time_expense') {
            final m = TimeExpense.fromJson(decodedMessage, uid);
            final mess = Message(
                timeExpence: m, sender: m.sender, messageId: m.messageId);
            final index = messages.indexWhere(
                (element) => element.timeExpence?.messageId == m.messageId);
            if (index != -1) {
              messages[index] = mess;
              doAnimate = false;
            } else if (m.isLoadMore) {
              messages.insert(0, mess);
              doAnimate = false;
            } else {
              messages.add(mess);
            }
          }

          // handle for current location
          else if (decodedMessage['message_type'] == 'location') {
            final m = CurrentLocationMessage.fromJson(decodedMessage, uid);
            final mess = Message(
                currentLocation: m, sender: m.sender, messageId: m.messageId);
            final index = messages.indexWhere(
                (element) => element.currentLocation?.messageId == m.messageId);
            if (index != -1) {
              messages[index] = mess;
              doAnimate = false;
            } else if (m.isLoadMore) {
              messages.insert(0, mess);
              doAnimate = false;
            } else {
              messages.add(mess);
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
            print('connection close reason => ${channel.closeReason}');
          }
        },
      );
    } catch (e) {
      print('Failed to connect: $e');
      _error = 'Failed to connect: $e';
    }
  }

  /// responsible for adding message to the channel
  void addMessage(Map<String, dynamic> data) {
    try {
      channel.sink.add(jsonEncode(data));
    } catch (e) {
      log('message sending error $e');
      rethrow;
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
        addMessage({"message_type": "text", "message": message});
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
      addMessage(createPoll.toJson());
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
      addMessage(votePoll.toJson());
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
      addMessage({
        "message_type": "load_more",
        "last_message_id": messages.first.textMessage != null
            ? (messages.first.textMessage!.messageId ?? '')
            : messages.first.poll != null
                ? (messages.first.poll?.messageId ?? '')
                : messages.first.timeExpence != null
                    ? (messages.first.timeExpence?.messageId ?? '')
                    : messages.first.file != null
                        ? (messages.first.file?.messageId ?? '')
                        : ''
      });
    }
  }

  /// create time and expence chat
  void addTimeExpence({required TimeExpenseUpdation timeExpenceUpdation}) {
    try {
      addMessage(timeExpenceUpdation.toJson());
    } catch (e) {
      print('Failed to update time and expence: $e');
      _error = 'Failed to update time and expence: $e';
    }
  }

  /// send image base64
  void sendImageBase64({required bool camera}) async {
    try {
      final image = await ImagePickerClass.getImage(camera: camera);
      if (image == null || image.base64 == null) return;
      print('send picture');
      addMessage({
        "message_type": "file",
        "files": [
          {"file": image.base64 ?? '', "file_type": 'image'}
        ],
        "messages": [""]
      });
    } catch (e) {
      print('Failed to send image: $e');
      _error = 'Failed to send image: $e';
      return;
    }
  }

  /// send pdf base64
  void sendPdfBase64() async {
    try {
      final pdf = await PdfPickerImpl().getPdf();
      if (pdf == null || pdf.base64 == null) return;
      final base64 = pdf.base64!.split('base64,').last;
      print('send pdf => ${pdf.name}');
      addMessage({
        "message_type": "file",
        "files": [
          {"file": base64, "file_type": 'pdf'}
        ],
        "messages": [pdf.name ?? 'Document']
      });
    } catch (e) {
      return;
    }
  }

  /// send current location
  void sendCurrentLocation() async {
    try {
      final locationService = LocationService();
      print('location started');
      final location = await locationService.getLatLong();
      if (location == null) return;
      print('send location => $location');
      addMessage({
        "message_type": "location",
        "location": location,
        "place":
            await locationService.getAddressFromLatLng(location[0], location[1])
      });
    } catch (e) {
      return;
    }
  }

  /// get map for current location
  void launchMapCurrentLocation(BuildContext context, List<double> location) {
    LaunchUrl.launchMapLatLong(location: location, context: context);
  }
}
