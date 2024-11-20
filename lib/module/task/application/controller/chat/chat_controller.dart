import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/core/api_endpoints/socket_endpoints.dart';
import 'package:bizkit/core/dipendency/di/dipendency_injection.dart';
import 'package:bizkit/core/model/image/image_model.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/chat/current_location/current_location_message.dart';
import 'package:bizkit/module/task/domain/model/chat/file/file_model.dart';
import 'package:bizkit/module/task/domain/model/chat/voice/voice_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_single_task_model/get_single_task_model.dart';
import 'package:bizkit/module/task/domain/model/chat/poll/create_poll.dart';
import 'package:bizkit/module/task/domain/model/chat/message.dart';
import 'package:bizkit/module/task/domain/model/chat/poll/poll.dart';
import 'package:bizkit/module/task/domain/model/chat/text/text_message.dart';
import 'package:bizkit/module/task/domain/model/chat/time_expence/time_expence_creation.dart';
import 'package:bizkit/module/task/domain/model/chat/time_expence/time_expence_message.dart';
import 'package:bizkit/module/task/domain/model/chat/poll/vote_poll.dart';
import 'package:bizkit/module/task/domain/repository/sqfilte/chat/task_chat_local_service_repo.dart';
import 'package:bizkit/packages/location/location_service.dart';
import 'package:bizkit/packages/pdf/pdf_picker.dart';
import 'package:bizkit/packages/sound/just_audio.dart';
import 'package:bizkit/packages/sound/sound_manager.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:bizkit/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:web_socket_channel/io.dart';

class ChatController extends GetxController {
  late IOWebSocketChannel channel;
  final TextEditingController controller = TextEditingController();
  final ScrollController chatScrollController = ScrollController();
  SoundManager soundManager = SoundManager();
  AudioPlayerHandler audioPlayerHandler = AudioPlayerHandler();

  /// task chat local db service model
  final TaskChatLocalServiceRepo taskChatLocalService =
      getIt<TaskChatLocalServiceRepo>();

  /// chat messages list
  RxList<Message> messages = <Message>[].obs;
  String _error = '';

  /// currently active chat task id
  String chatTaskId = '';

  /// messages first loading or not
  bool firstLoad = true;

  /// current loaction fetching loading
  RxBool currentLocationFetching = false.obs;

  /// socket connection loading
  RxBool connectionLoading = false.obs;

  /// connected to socket or not
  RxBool connected = false.obs;

  /// loading for more messages history
  RxBool loadMoreLoading = false.obs;

  /// audio is been currently recording or not
  RxBool isRecording = false.obs;

  /// recorded base64 audio
  RxString recordedAudio = ''.obs;

  /// recorded audio is playing or not
  RxBool isPlaying = false.obs;

  /// recorded audio is paused or not
  RxBool isPaused = false.obs;

  /// used to store the current location for sending location
  RxList<double> currentLocationLatLong = <double>[].obs;

  /// current location name
  RxString currentLocation = ''.obs;

  /// images before sending
  RxList<ImageModel> loadedImages = <ImageModel>[].obs;

  /// record Duration
  RxInt recordDuration = 0.obs;

  /// recorder current positon
  RxInt playBackPosition = 0.obs;

  /// timer for audio
  late Timer recordTimer;

  /// currently active poll details
  Rx<Poll> pollDetail = Poll().obs;

  // Define the AppPermissionStatus enum

  /// connect to the channel with task id and handle the messages form the channel
  void connectChannel(BuildContext context, {required String? taskId}) async {
    _error = '';
    connectionLoading.value = true;
    loadMoreLoading.value = false;
    chatTaskId = taskId ?? '';
    chatScrollController.addListener(() {
      checkLoading();
    });
    soundManager = SoundManager();
    isPlaying.value = false;
    isPaused.value = false;
    recordedAudio.value = '';
    final token = await SecureStorage.getToken();
    final accessToken = token.accessToken ?? '';
    final uid = token.uid ?? '';
    firstLoad = true;
    messages.clear();

    try {
      print('message count taskId => $taskId');
      await getMessageFromLocaldb(firstCall: true);
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
          // if there is nothing to load more then stop loading
          else if (loadMoreLoading.value &&
              decodedMessage['is_last_batch'] != null) {
            loadMoreLoading.value = false;
          }
          // create model and add to list according to the position
          doAnimate =
              addMessageToListByCheckingType(decodedMessage, uid, doAnimate);

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
      // ignore: use_build_context_synchronously
      GoRouter.of(context).pop();
    }
  }

  /// create the [Message] model for add to [messages] to show it in the ui
  bool addMessageToListByCheckingType(
      Map<String, dynamic> decodedMessage, String uid, bool doAnimate) {
    switch (decodedMessage['message_type']) {
      case 'text':
        final m = TextMessage.fromJson(decodedMessage, uid: uid);
        final mess = Message(
            deleted: decodedMessage['deleted'] ?? false,
            textMessage: m,
            sender: m.sender,
            messageId: m.messageId,
            messageType: m.messageType,
            taskId: chatTaskId,
            timestamp: m.timestamp);
        final index = messages.indexWhere(
            (element) => element.textMessage?.messageId == m.messageId);
        if (index != -1) {
          messages[index] = mess;
          doAnimate = false;
        } else {
          if (m.isLoadMore) {
            loadMoreLoading.value = false;
            doAnimate = false;
          }
          insertMessageToList(mess);
        }
        taskChatLocalService.insertOrUpdateMessage(message: mess);
        break;

      case 'file':
        final m = FileMessage.fromJson(decodedMessage, uid: uid);
        final mess = Message(
            deleted: decodedMessage['deleted'] ?? false,
            file: m,
            sender: m.sender,
            messageId: m.messageId,
            messageType: m.messageType,
            taskId: chatTaskId,
            timestamp: m.timestamp);
        final index = messages
            .indexWhere((element) => element.file?.messageId == m.messageId);
        if (index != -1) {
          messages[index] = mess;
          doAnimate = false;
        } else {
          if (m.isLoadMore) {
            loadMoreLoading.value = false;
            doAnimate = false;
          }
          insertMessageToList(mess);
        }
        taskChatLocalService.insertOrUpdateMessage(message: mess);
        break;

      case 'poll':
        final m = Poll.fromJson(decodedMessage, uid: uid);
        final mess = Message(
            deleted: decodedMessage['deleted'] ?? false,
            poll: m,
            sender: m.sender,
            messageId: m.messageId,
            messageType: m.messageType,
            taskId: chatTaskId,
            timestamp: m.timestamp);
        final index = messages
            .indexWhere((element) => element.poll?.messageId == m.messageId);
        if (index != -1) {
          messages[index] = mess;
          doAnimate = false;
        } else {
          if (m.isLoadMore) {
            loadMoreLoading.value = false;
            doAnimate = false;
          }
          insertMessageToList(mess);
        }
        taskChatLocalService.insertOrUpdateMessage(message: mess);
        break;

      case 'time_expense':
        Get.find<CreateTaskController>().fetchSingleTask(
            singleTaskModel: GetSingleTaskModel(taskId: chatTaskId));
        final m = TimeExpense.fromJson(decodedMessage, uid: uid);
        final mess = Message(
            deleted: decodedMessage['deleted'] ?? false,
            timeExpence: m,
            sender: m.sender,
            messageId: m.messageId,
            messageType: m.messageType,
            taskId: chatTaskId,
            timestamp: m.timestamp);
        final index = messages.indexWhere(
            (element) => element.timeExpence?.messageId == m.messageId);
        if (index != -1) {
          messages[index] = mess;
          doAnimate = false;
        } else {
          if (m.isLoadMore) {
            loadMoreLoading.value = false;
            doAnimate = false;
          }
          insertMessageToList(mess);
        }
        taskChatLocalService.insertOrUpdateMessage(message: mess);
        break;

      case 'location':
        final m = CurrentLocationMessage.fromJson(decodedMessage, uid: uid);
        final mess = Message(
            deleted: decodedMessage['deleted'] ?? false,
            currentLocation: m,
            sender: m.sender,
            messageId: m.messageId,
            messageType: m.messageType,
            taskId: chatTaskId,
            timestamp: m.timestamp);
        final index = messages.indexWhere(
            (element) => element.currentLocation?.messageId == m.messageId);
        if (index != -1) {
          messages[index] = mess;
          doAnimate = false;
        } else {
          if (m.isLoadMore) {
            loadMoreLoading.value = false;
            doAnimate = false;
          }
          insertMessageToList(mess);
        }
        taskChatLocalService.insertOrUpdateMessage(message: mess);
        break;

      case 'voice':
        final m = VoiceMessage.fromJson(decodedMessage, uid: uid);
        final mess = Message(
            deleted: decodedMessage['deleted'] ?? false,
            voiceMessage: m,
            sender: m.sender,
            messageId: m.messageId,
            messageType: m.messageType,
            taskId: chatTaskId,
            timestamp: m.timestamp);
        final index = messages.indexWhere(
            (element) => element.voiceMessage?.messageId == m.messageId);
        if (index != -1) {
          messages[index] = mess;
          doAnimate = false;
        } else {
          if (m.isLoadMore) {
            loadMoreLoading.value = false;
            doAnimate = false;
          }
          insertMessageToList(mess);
        }
        taskChatLocalService.insertOrUpdateMessage(message: mess);
        break;

      default:
        // Handle unsupported message types if needed
        break;
    }
    return doAnimate;
  }

  /// add message to the list [messages] by binary search with datetime
  void insertMessageToList(Message m) {
    int left = 0;
    int right = messages.length - 1;
    // using binary search to find the position of message in chat
    while (left <= right) {
      int mid = left + (right - left) ~/ 2;
      if (DateTime.tryParse(messages[mid].timestamp ?? '')!
          .isAfter(DateTime.tryParse(m.timestamp ?? '')!)) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    messages.insert(left, m);
  }

  /// get messages form local db according to the current massage list limit
  Future<void> getMessageFromLocaldb({required bool firstCall}) async {
    try {
      log('getMessageFromLocaldb called');
      final messageList = await taskChatLocalService.getMessagesWithLimit(
          limit: firstCall ? 40 : 20,
          offset: firstCall ? 0 : messages.length,
          taskId: chatTaskId);
      log('getMessageFromLocaldb message list => ${messageList?.length}');
      for (var e in messageList ?? <Message>[]) {
        final index =
            messages.indexWhere((element) => element.messageId == e.messageId);
        if (index == -1) {
          insertMessageToList(e);
        }
      }
      loadMoreLoading.value = false;
    } catch (e) {
      log('getMessageFromLocaldb exception => ${e.toString()}');
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
  void sendTextMessage() async {
    if (controller.text.isNotEmpty) {
      final message = controller.text.trim();
      try {
        // for (int i = 0; i < 400; i++) {
        //   await Future.delayed(Duration(milliseconds: 1));
        //   addMessage({"message_type": "text", "message": 'message - $i'});
        // }
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
  void checkLoading() async {
    if (chatScrollController.offset ==
        chatScrollController.position.maxScrollExtent) {
      print('call load more message');
      loadMoreLoading.value = true;
      await getMessageFromLocaldb(firstCall: false);
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
        loadedImages.value = [images]; // Assign the image to loadedImages
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
            // "file_type": loadedImages[index].type ?? ''
            "file_type": 'image'
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

  /// on mic tap record and stop
  void micTap() {
    if (isRecording.value) {
      _stopRecording();
    } else {
      _startRecording();
    }
  }

  /// add counter for timer voice chat
  void _startRecordTimer() {
    recordDuration.value = 0;
    recordTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      recordDuration.value++;
    });
  }

  /// end record timer
  void _endRecordTimer() {
    recordTimer.cancel();
  }

  /// start recording audio
  void _startRecording() async {
    recordDuration.value = 0;
    recordedAudio.value = '';
    isRecording.value = true;
    await soundManager.startRecording();
    _startRecordTimer();
    print('recording started ==> ');
  }

  /// stop recording audio
  void _stopRecording() async {
    await soundManager.stopRecording();
    _endRecordTimer();
    recordedAudio.value = soundManager.getBase64Audio() ?? '';
    print('recorded audio => ${recordedAudio.value}');
    isRecording.value = false;
    getRecordDuration();
    audioPlayerHandler = AudioPlayerHandler()
      ..totalDuration = Duration(seconds: recordDuration.value);
  }

  /// play pause controller
  void playPauseRecordedAudio() {
    if (isPaused.value) {
      _resumeRecordedAudio();
    } else if (isPlaying.value) {
      _pauseRecordedAudio();
      // _stopPlayingRecordedAudio();
    } else {
      _playRecordedAudio();
    }
  }

  /// delete recorded audio
  void deleteRecordedAudio() {
    recordedAudio.value = '';
  }

  void getRecordDuration() {
    recordDuration.value = soundManager.getRecordDuration();
  }

  // void getPlaybackPosition() {
  //   playBackPosition.value = soundManager.getPlaybackPosition();
  // }

  /// when recording finished
  void _whenFinished() {
    isPlaying.value = false;
    isPaused.value = false;
  }

  /// play recorded audio
  void _playRecordedAudio() async {
    isPlaying.value = true;
    isPaused.value = false;
    print('playing recorded audio');
    // final play = await soundManager.playRecording(whenFinished: _whenFinished);
    final play = await audioPlayerHandler.playAudioFromBase64(
        recordedAudio.value,
        onCurrentPositionChanged: (currentPosition) {},
        whenFinished: _whenFinished);
    print('played or not  ---------------------------==> $play');
    if (!play) {
      isPlaying.value = false;
      print('-------------------error playing audio------------------');
    }
    // print('player status -> ${soundManager.isPlaying()}');
    // while (soundManager.isPlaying() && isPlaying.value && !isPaused.value) {
    //   print('playing');
    // }
    // isPlaying.value = false;
  }

  /// pause recorded audio
  void _pauseRecordedAudio() async {
    // await soundManager.pausePlayback();
    audioPlayerHandler.pauseAudio();
    isPlaying.value = false;
    isPaused.value = true;
    print('pause recorded audio');
  }

  /// pause recorded audio
  void _stopPlayingRecordedAudio() async {
    // await soundManager.stopPlayback();
    audioPlayerHandler.stopAudio();
    isPlaying.value = false;
    isPaused.value = false;
    print('stop playing recorded audio');
  }

  /// resume recorded audio
  void _resumeRecordedAudio() async {
    // await soundManager.resumePlayback();
    audioPlayerHandler.resumeAudio();
    isPlaying.value = true;
    isPaused.value = false;
    print('pause recorded audio');
  }

  /// send audio
  void sendAudio() {
    getRecordDuration();
    if (isPlaying.value) _stopPlayingRecordedAudio();
    addMessage({
      "message_type": "voice",
      "voice_message": recordedAudio.value,
      "duration": DateTimeFormater.getDurtionFromSeconds(recordDuration.value)
    });
    recordedAudio.value = '';
  }
}
