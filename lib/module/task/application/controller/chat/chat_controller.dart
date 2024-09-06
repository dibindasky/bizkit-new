import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/core/api_endpoints/socket_endpoints.dart';
import 'package:bizkit/core/model/image/image_model.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/chat/current_location_message.dart';
import 'package:bizkit/module/task/domain/model/chat/file_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/packages/location/location_service.dart';
import 'package:bizkit/packages/pdf/pdf_picker.dart';
import 'package:bizkit/packages/sound/sound_manager.dart';
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
import 'package:go_router/go_router.dart';
import 'package:web_socket_channel/io.dart';

class ChatController extends GetxController {
  late IOWebSocketChannel channel;
  final TextEditingController controller = TextEditingController();
  final ScrollController chatScrollController = ScrollController();
  final SoundManager soundManager = SoundManager();

  /// chat message list
  RxList<Message> messages = <Message>[].obs;
  String _error = '';
  String chatTaskId = '';
  bool firstLoad = true;
  RxBool currentLocationFetching = false.obs;
  RxBool connectionLoading = false.obs;
  RxBool connected = false.obs;
  RxBool loadMoreLoading = false.obs;
  RxBool isRecording = false.obs;
  RxBool isPlaying = false.obs;
  RxList<double> currentLocationLatLong = <double>[].obs;
  RxList<ImageModel> loadedImages = <ImageModel>[].obs;
  RxString currentLocation = ''.obs;

  Rx<Poll> pollDetail = Poll().obs;

  /// connect to the channel with task id and handle the messages form the channel
  void connectChannel(BuildContext context, {required String? taskId}) async {
    _error = '';
    connectionLoading.value = true;
    loadMoreLoading.value = false;
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
      connectionLoading.value = false;
      channel.stream.listen(
        (message) {
          // Decode the message from JSON
          final decodedMessage =
              jsonDecode(message as String) as Map<String, dynamic>;

          print(decodedMessage);
          bool doAnimate = true;

          // WebSocket connection established successfully
          if (decodedMessage['type'] == 'connection_success') {
            print(
                "connection success => WebSocket connection established successfully");
            connectionLoading.value = false;
            connected.value = true;
          }

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
              loadMoreLoading.value = false;
              doAnimate = false;
              messages.add(mess);
            } else {
              messages.insert(0, mess);
            }
          }

          // handle for file type
          else if (decodedMessage['message_type'] == 'file') {
            final m = FileMessage.fromJson(decodedMessage, uid);
            final mess =
                Message(file: m, sender: m.sender, messageId: m.messageId);
            final index = messages.indexWhere(
                (element) => element.file?.messageId == m.messageId);
            if (index != -1) {
              messages[index] = mess;
              doAnimate = false;
            } else if (m.isLoadMore) {
              loadMoreLoading.value = false;
              doAnimate = false;
              messages.add(mess);
            } else {
              messages.insert(0, mess);
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
              loadMoreLoading.value = false;
              doAnimate = false;
              messages.add(mess);
            } else {
              messages.insert(0, mess);
            }
          }

          // handle for expence and time
          else if (decodedMessage['message_type'] == 'time_expense') {
            Get.find<CreateTaskController>().fetchSingleTask(
                singleTaskModel: GetSingleTaskModel(taskId: chatTaskId));
            final m = TimeExpense.fromJson(decodedMessage, uid);
            final mess = Message(
                timeExpence: m, sender: m.sender, messageId: m.messageId);
            final index = messages.indexWhere(
                (element) => element.timeExpence?.messageId == m.messageId);
            if (index != -1) {
              messages[index] = mess;
              doAnimate = false;
            } else if (m.isLoadMore) {
              loadMoreLoading.value = false;
              doAnimate = false;
              messages.add(mess);
            } else {
              messages.insert(0, mess);
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
              loadMoreLoading.value = false;
              doAnimate = false;
              messages.add(mess);
            } else {
              messages.insert(0, mess);
            }
          }

          update(['chat']);
          // animate the scroll controller if necessary
          if (decodedMessage['is_load_more'] != true && doAnimate) {
            Timer(
              const Duration(milliseconds: 200),
              () {
                // chatScrollController.animateTo(
                //   firstLoad
                //       ? chatScrollController.position.minScrollExtent
                //       : chatScrollController.position.pixels -
                //           (decodedMessage['message_type'] == 'text'
                //               ? 100
                //               : 500),
                //   duration: const Duration(milliseconds: 300),
                //   curve: Curves.easeIn,
                // );
              },
            );
          }
        },
        onError: (error) {
          print('Connection error: $error');
          _error = 'Connection error: $error';
          connectionLoading.value = false;
          connected.value = false;
          GoRouter.of(context).pop();
        },
        onDone: () {
          if (channel.closeCode != null) {
            print('Connection closed with code: ${channel.closeCode}');
            _error = 'Connection closed with code: ${channel.closeCode}';
            print('connection close reason => ${channel.closeReason}');
          }
          connectionLoading.value = false;
          connected.value = false;
          GoRouter.of(context).pop();
        },
      );
    } catch (e) {
      print('Failed to connect: $e');
      _error = 'Failed to connect: $e';
      connectionLoading.value = false;
      connected.value = false;
      GoRouter.of(context).pop();
    }
  }

  /// responsible for adding message to the channel
  void addMessage(Map<String, dynamic> data) {
    try {
      print('addMessage => $data');
      channel.sink.add(jsonEncode(data));
    } catch (e) {
      log('message sending error $e');
      rethrow;
    }
  }

  /// close channel connection
  void closeConnetion(BuildContext context) {
    if (!connected.value) {
      GoRouter.of(context).pop();
      return;
    }
    try {
      messages.clear();
      channel.sink.close();
      connected.value = false;
      print('connection closed');
      // channel.sink.close(status.goingAway);
    } catch (e) {
      print('Channel close error =>$e');
    }
  }

  /// send text message
  void sendTextMessage() {
    if (controller.text.isNotEmpty) {
      final message = controller.text.trim();
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
    if (!loadMoreLoading.value &&
        chatScrollController.offset ==
            chatScrollController.position.maxScrollExtent) {
      print('call load more message');
      loadMoreLoading.value = true;
      update(['chat']);
      addMessage({
        "message_type": "load_more",
        "last_message_id": messages.last.messageId
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

  /// getImage from Storage
  void getImageBase64({required bool camera}) async {
    try {
      final images = await ImagePickerClass.getImage(camera: camera);
      if (images != null && images.base64 != null) {
        loadedImages.value = [images];
      }
    } catch (e) {
      print('Failed to get image: $e');
      _error = 'Failed to get image: $e';
      return;
    }
  }

  /// send image base64
  void sendImageBase64() async {
    try {
      if (loadedImages.isEmpty) return;
      print('send picture');
      addMessage({
        "message_type": "file",
        "files": List.generate(
          loadedImages.length,
          (index) => {
            "file": loadedImages[index].base64 ?? '',
            "file_type": loadedImages[index].type ?? ''
          },
        ),
        "messages": [controller.text.trim()]
      });
      controller.clear();
      loadedImages.clear();
    } catch (e) {
      print('Failed to send image: $e');
      _error = 'Failed to send image: $e';
      return;
    }
  }

  /// clear image form selected list
  void clearImageFromSelectedList(int index) {
    if (loadedImages.isEmpty) return;
    loadedImages.removeAt(index);
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

  void getCurrentLocation() async {
    currentLocation.value = '';
    currentLocationLatLong.value = <double>[];
    currentLocationFetching.value = true;
    final locationService = LocationService();
    print('location started');
    final location = await locationService.getLatLong();
    if (location == null) {
      currentLocationFetching.value = false;
      return;
    }
    currentLocationLatLong.value = location;
    currentLocation.value =
        await locationService.getAddressFromLatLng(location[0], location[1]) ??
            '';
    currentLocationFetching.value = false;
  }

  /// send current location
  void sendCurrentLocation(BuildContext context) {
    try {
      addMessage({
        "message_type": "location",
        "location": currentLocationLatLong,
        "place": currentLocation.value
      });
      GoRouter.of(context).pop();
    } catch (e) {
      return;
    }
  }

  /// get map for current location
  void launchMapCurrentLocation(BuildContext context, List<double> location) {
    LaunchUrl.launchMapLatLong(location: location, context: context);
  }

  /// send audio message
  void sendAudioMessage(String audio) {
    print('send audio message ---::::...::.:::.::.');
  }

  /// on mic tap record and stop
  void micTap() {
    if (isRecording.value) {
      stopRecording();
    } else {
      startRecording();
    }
  }

  /// start recording audio
  void startRecording() {
    isRecording.value = true;
    soundManager.startRecording();
  }

  /// stop recording audio
  void stopRecording() {
    soundManager.stopRecording();
    isRecording.value = false;
  }

  /// send audio
  void sendAudio() {
    addMessage({});
  }
}
