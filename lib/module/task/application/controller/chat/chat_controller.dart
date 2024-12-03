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
import 'package:uuid/uuid.dart';

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

  // current user id
  String _uid = '';

  // Define the AppPermissionStatus enum

  /// connect to the channel with task id and handle the messages form the channel
  void connectChannel(BuildContext context, {required String? taskId}) async {
    final token = await SecureStorage.getToken();
    final accessToken = token.accessToken ?? '';
    _uid = token.uid ?? '';
    _error = '';
    // connectionLoading.value = true;
    loadMoreLoading.value = false;
    chatTaskId = taskId ?? '';
    chatScrollController.addListener(() {
      checkLoading();
    });
    soundManager = SoundManager();
    isPlaying.value = false;
    isPaused.value = false;
    recordedAudio.value = '';
    // firstLoad = true;
    messages.clear();

    try {
      print('message count taskId => $taskId');
      await getMessageFromLocaldb(firstCall: true);
      await Future.delayed(const Duration(seconds: 10));
      channel = IOWebSocketChannel.connect(
        Uri.parse(
            SocketEndpoints.taskChat.replaceFirst('{task_id}', taskId ?? '')),
        headers: {'Authorization': 'Bearer $accessToken'},
      );
      connectionLoading.value = false;
      channel.stream.listen(
        (message) async {
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
          doAnimate = await _addMessageToListByCheckingType(
              decodedMessage: decodedMessage, uid: _uid, doAnimate: doAnimate);
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

  /// generate an unique id for message to store locally
  String getUniqueId() {
    return const Uuid().v4();
  }

  /// create the [Message] model for add to [messages] to show it in the ui
  Future<bool> _addMessageToListByCheckingType(
      {required Map<String, dynamic> decodedMessage,
      required String uid,
      required bool doAnimate,
      bool fromSend = false}) async {
    print('decoadedMessage ${decodedMessage.toString()}');
    switch (decodedMessage['message_type']) {
      case 'text':
        final m = TextMessage.fromJson(decodedMessage, uid: uid);
        final mess = Message(
            localId: decodedMessage['local_id'] as String?,
            deleted: (decodedMessage['deleted'] as bool?) ?? false,
            textMessage: m,
            sender: m.sender,
            messageId: m.messageId,
            messageType: 'text',
            taskId: chatTaskId,
            isLoadMore: false,
            timestamp: m.timestamp);
        if (fromSend) {
          insertMessageToList(mess);
        } else {
          final index = messages.indexWhere((element) =>
              element.textMessage?.localId == m.localId ||
              ((element.textMessage?.messageId?.isNotEmpty ?? false) &&
                  (m.messageId?.isNotEmpty ?? false) &&
                  (element.textMessage?.messageId == m.messageId)));
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
        }
        await taskChatLocalService.insertOrUpdateMessage(message: mess);
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
        final index = messages.indexWhere((element) =>
            element.file?.messageId == m.messageId ||
            element.file?.localId == m.localId);
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
        await taskChatLocalService.insertOrUpdateMessage(message: mess);
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
        final index = messages.indexWhere((element) =>
            element.poll?.messageId == m.messageId ||
            element.poll?.localId == m.localId);
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
        await taskChatLocalService.insertOrUpdateMessage(message: mess);
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
        final index = messages.indexWhere((element) =>
            element.timeExpence?.messageId == m.messageId ||
            element.timeExpence?.localId == m.localId);
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
        await taskChatLocalService.insertOrUpdateMessage(message: mess);
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
        final index = messages.indexWhere((element) =>
            element.currentLocation?.messageId == m.messageId ||
            element.currentLocation?.localId == m.localId);
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
        await taskChatLocalService.insertOrUpdateMessage(message: mess);
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
        final index = messages.indexWhere((element) =>
            element.voiceMessage?.messageId == m.messageId ||
            element.voiceMessage?.localId == m.localId);
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
        await taskChatLocalService.insertOrUpdateMessage(message: mess);
        break;

      default:
        // Handle unsupported message types if needed
        log('message type not found ${decodedMessage['message_type']}');
        break;
    }
    return doAnimate;
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
    update(['chat']);
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
        final index = messages.indexWhere((element) =>
            (element.localId == e.localId) ||
            ((e.messageId?.isNotEmpty ?? false) &&
                (element.messageId?.isNotEmpty ?? false) &&
                e.messageId == element.messageId));
        if (index == -1 || index == null) {
          insertMessageToList(e);
        }
      }
      loadMoreLoading.value = false;
    } catch (e) {
      log('getMessageFromLocaldb exception => ${e.toString()}');
    }
  }

  Message createMessageModelForLocalDb(String localId, String type) {
    return Message(
      isLoadMore: false,
      sender: true,
      localId: localId,
      deleted: false,
      messageType: type,
      taskId: chatTaskId,
      timestamp: DateTime.now().toIso8601String(),
    );
  }

  /// responsible for adding message to the channel
  void addMessageToChannel(
      {required Map<String, dynamic> data,
      Map<String, dynamic>? message}) async {
    try {
      if (message != null) {
        // log('message => ${message.toJson().toString()}');
        await _addMessageToListByCheckingType(
          decodedMessage: message,
          uid: _uid,
          doAnimate: false,
          fromSend: false,
        );
        data['local_id'] = message['local_id'];
      }
      print('addMessage => $data');
      channel.sink.add(jsonEncode(data));
      final messageList = await taskChatLocalService.getMessagesWithLimit(
          limit: 40, offset: 0, taskId: chatTaskId);
      print('message list after send data => ${messageList?.length}');
      messageList?.map((e) {
        print('message list data -> ${e.toJson()}');
        return false;
      });
    } catch (e) {
      log('message sending error $e');
      rethrow;
    }
  }

  /// send text message
  void sendTextMessage() async {
    if (controller.text.isNotEmpty) {
      final text = controller.text.trim();
      try {
        String localId = getUniqueId();
        // create a model for showing it to the ui before sending it to server
        Message message = createMessageModelForLocalDb(localId, 'text');
        // message.
        var textMessage = TextMessage(
            currentUid: _uid,
            isLoadMore: false,
            localId: localId,
            message: text,
            messageType: 'text',
            readByAll: false,
            sender: true,
            userId: _uid,
            readBy: [],
            timestamp: message.timestamp);
        addMessageToChannel(
            data: {"message_type": "text", "message": text},
            message: textMessage.toJson());
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
      String localId = getUniqueId();
      // create a model for showing it to the ui before sending it to server
      Message message = createMessageModelForLocalDb(localId, 'poll');
      message.poll = Poll();
      addMessageToChannel(data: createPoll.toJson());
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
      // String localId = getUniqueId();
      // create a model for showing it to the ui before sending it to server
      // Message message = _createMessageModelForLocalDb(localId,'poll');
      addMessageToChannel(data: votePoll.toJson());
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
      addMessageToChannel(data: {
        "message_type": "load_more",
        "last_message_id": messages.last.messageId
      });
    }
  }

  /// create time and expence chat
  void addTimeExpence({required TimeExpenseUpdation timeExpenceUpdation}) {
    try {
      String localId = getUniqueId();
      // create a model for showing it to the ui before sending it to server
      Message message = createMessageModelForLocalDb(localId, 'time_expense');
      message.timeExpence = TimeExpense();
      addMessageToChannel(
        data: timeExpenceUpdation.toJson(),
      );
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
      String localId = getUniqueId();
      // create a model for showing it to the ui before sending it to server
      Message message = createMessageModelForLocalDb(localId, 'file');
      message.file = FileMessage();
      print('send picture');
      addMessageToChannel(data: {
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
      String localId = getUniqueId();
      // create a model for showing it to the ui before sending it to server
      Message message = createMessageModelForLocalDb(localId, 'file');
      message.file = FileMessage();
      print('send pdf => ${pdf.name}');
      addMessageToChannel(
        data: {
          "message_type": "file",
          "files": [
            {"file": base64, "file_type": 'pdf'}
          ],
          "messages": [pdf.name ?? 'Document']
        },
      );
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
      String localId = getUniqueId();
      // create a model for showing it to the ui before sending it to server
      Message message = createMessageModelForLocalDb(localId, 'location');
      message.currentLocation = CurrentLocationMessage();
      addMessageToChannel(
        data: {
          "message_type": "location",
          "location": currentLocationLatLong,
          "place": currentLocation.value
        },
      );
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
      stopRecording();
    } else {
      startRecording();
    }
  }

  /// add counter for timer voice chat
  void startRecordTimer() {
    recordDuration.value = 0;
    recordTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      recordDuration.value++;
    });
  }

  /// end record timer
  void endRecordTimer() {
    recordTimer.cancel();
  }

  /// start recording audio
  void startRecording() async {
    recordDuration.value = 0;
    recordedAudio.value = '';
    isRecording.value = true;
    await soundManager.startRecording();
    startRecordTimer();
    print('recording started ==> ');
  }

  /// stop recording audio
  void stopRecording() async {
    await soundManager.stopRecording();
    endRecordTimer();
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
      resumeRecordedAudio();
    } else if (isPlaying.value) {
      pauseRecordedAudio();
      // _stopPlayingRecordedAudio();
    } else {
      playRecordedAudio();
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
  void whenFinished() {
    isPlaying.value = false;
    isPaused.value = false;
  }

  /// play recorded audio
  void playRecordedAudio() async {
    isPlaying.value = true;
    isPaused.value = false;
    print('playing recorded audio');
    // final play = await soundManager.playRecording(whenFinished: _whenFinished);
    final play = await audioPlayerHandler.playAudioFromBase64(
        recordedAudio.value,
        onCurrentPositionChanged: (currentPosition) {},
        whenFinished: whenFinished);
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
  void pauseRecordedAudio() async {
    // await soundManager.pausePlayback();
    audioPlayerHandler.pauseAudio();
    isPlaying.value = false;
    isPaused.value = true;
    print('pause recorded audio');
  }

  /// pause recorded audio
  void stopPlayingRecordedAudio() async {
    // await soundManager.stopPlayback();
    audioPlayerHandler.stopAudio();
    isPlaying.value = false;
    isPaused.value = false;
    print('stop playing recorded audio');
  }

  /// resume recorded audio
  void resumeRecordedAudio() async {
    // await soundManager.resumePlayback();
    audioPlayerHandler.resumeAudio();
    isPlaying.value = true;
    isPaused.value = false;
    print('pause recorded audio');
  }

  /// send audio
  void sendAudio() {
    getRecordDuration();
    if (isPlaying.value) stopPlayingRecordedAudio();
    String localId = getUniqueId();
    // create a model for showing it to the ui before sending it to server
    Message message = createMessageModelForLocalDb(localId, 'voice');
    message.voiceMessage = VoiceMessage();
    addMessageToChannel(
      data: {
        "message_type": "voice",
        "voice_message": recordedAudio.value,
        "duration": DateTimeFormater.getDurtionFromSeconds(recordDuration.value)
      },
    );
    recordedAudio.value = '';
  }
}
