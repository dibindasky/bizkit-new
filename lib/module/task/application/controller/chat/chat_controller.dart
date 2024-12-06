import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/core/api_endpoints/socket_endpoints.dart';
import 'package:bizkit/core/dipendency/di/dipendency_injection.dart';
import 'package:bizkit/core/model/image/image_model.dart';
import 'package:bizkit/module/task/application/controller/task/task_controller.dart';
import 'package:bizkit/module/task/domain/model/chat/current_location/current_location_message.dart';
import 'package:bizkit/module/task/domain/model/chat/file/file_model.dart';
import 'package:bizkit/module/task/domain/model/chat/poll/poll_answer.dart';
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
import 'package:bizkit/packages/path_provider/path_provider.dart';
import 'package:bizkit/packages/pdf/pdf_picker.dart';
import 'package:bizkit/packages/sound/just_audio.dart';
import 'package:bizkit/packages/sound/sound_manager.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/utils/constants/constant.dart';
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
  final PathProvider pathProvider = PathProvider();
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

  /// file download messages ids
  RxList<String> downloadingMessagesFilesId = <String>[].obs;

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
          // connectChannel(context, taskId: taskId);
          // GoRouter.of(context).pop();
        },
        onDone: () {
          if (channel.closeCode != null) {
            print('Connection closed with code: ${channel.closeCode}');
            _error = 'Connection closed with code: ${channel.closeCode}';
            print('connection close reason => ${channel.closeReason}');
          }
          connectionLoading.value = false;
          connected.value = false;
          // GoRouter.of(context).pop();
        },
      );
    } catch (e) {
      print('Failed to connect: $e');
      _error = 'Failed to connect: $e';
      connectionLoading.value = false;
      connected.value = false;
      // ignore: use_build_context_synchronously
      // connectChannel(context, taskId: taskId);
      // GoRouter.of(context).pop();
    }
  }

  // void _reConnect({required String accessToken}) {
  //   channel = IOWebSocketChannel.connect(
  //     Uri.parse(SocketEndpoints.taskChat.replaceFirst('{task_id}', chatTaskId)),
  //     headers: {'Authorization': 'Bearer $accessToken'},
  //   );
  // }

  /// generate an unique id for message to store locally
  String getUniqueId() => const Uuid().v4();

  /// create the [Message] model for add to [messages] to show it in the ui
  Future<bool> _addMessageToListByCheckingType(
      {required Map<String, dynamic> decodedMessage,
      required String uid,
      required bool doAnimate,
      bool fromSend = false}) async {
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
              ((element.textMessage?.localId?.isNotEmpty ?? false) &&
                  (m.localId?.isNotEmpty ?? false) &&
                  element.textMessage?.localId == m.localId) ||
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
        // if (!fromSend) {
        //   String? filePath = await pathProvider.downloadSaveToFileAndReturnPath(
        //       path: 'chat/file', module: Module.task, urlPath: m.file ?? '');
        //   print('file location  -> $filePath');
        //   m.filePath = filePath;
        // }

        final mess = Message(
            localId: decodedMessage['local_id'] as String?,
            deleted: (decodedMessage['deleted'] as bool?) ?? false,
            file: m,
            sender: m.sender,
            messageId: m.messageId,
            messageType: 'file',
            taskId: chatTaskId,
            timestamp: m.timestamp);
        if (fromSend) {
          insertMessageToList(mess);
        } else {
          final index = messages.indexWhere((element) =>
              ((element.file?.localId?.isNotEmpty ?? false) &&
                  (m.localId?.isNotEmpty ?? false) &&
                  element.file?.localId == m.localId) ||
              ((element.file?.messageId?.isNotEmpty ?? false) &&
                  (m.messageId?.isNotEmpty ?? false) &&
                  (element.file?.messageId == m.messageId)));
          if (index != -1) {
            mess.file?.filePath = messages[index].file?.filePath;
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

      case 'poll':
        final m = Poll.fromJson(decodedMessage, uid: uid);
        final mess = Message(
            localId: decodedMessage['local_id'] as String?,
            deleted: (decodedMessage['deleted'] as bool?) ?? false,
            poll: m,
            sender: m.sender,
            messageId: m.messageId,
            messageType: m.messageType,
            taskId: chatTaskId,
            timestamp: m.timestamp);
        if (fromSend) {
          insertMessageToList(mess);
        } else {
          final index = messages.indexWhere((element) =>
              ((element.poll?.localId?.isNotEmpty ?? false) &&
                  (m.localId?.isNotEmpty ?? false) &&
                  element.poll?.localId == m.localId) ||
              ((element.poll?.messageId?.isNotEmpty ?? false) &&
                  (m.messageId?.isNotEmpty ?? false) &&
                  (element.poll?.messageId == m.messageId)));
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

      case 'time_expense':
        Get.find<CreateTaskController>().fetchSingleTask(
            singleTaskModel: GetSingleTaskModel(taskId: chatTaskId));
        final m = TimeExpense.fromJson(decodedMessage, uid: uid);
        final mess = Message(
            localId: decodedMessage['local_id'] as String?,
            deleted: (decodedMessage['deleted'] as bool?) ?? false,
            timeExpence: m,
            sender: m.sender,
            messageId: m.messageId,
            messageType: m.messageType,
            taskId: chatTaskId,
            timestamp: m.timestamp);
        if (fromSend) {
          insertMessageToList(mess);
        } else {
          final index = messages.indexWhere((element) =>
              ((element.timeExpence?.localId?.isNotEmpty ?? false) &&
                  (m.localId?.isNotEmpty ?? false) &&
                  element.timeExpence?.localId == m.localId) ||
              ((element.timeExpence?.messageId?.isNotEmpty ?? false) &&
                  (m.messageId?.isNotEmpty ?? false) &&
                  (element.timeExpence?.messageId == m.messageId)));
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

      case 'location':
        final m = CurrentLocationMessage.fromJson(decodedMessage, uid: uid);
        final mess = Message(
            localId: decodedMessage['local_id'] as String?,
            deleted: (decodedMessage['deleted'] as bool?) ?? false,
            currentLocation: m,
            sender: m.sender,
            messageId: m.messageId,
            messageType: m.messageType,
            taskId: chatTaskId,
            timestamp: m.timestamp);
        if (fromSend) {
          insertMessageToList(mess);
        } else {
          final index = messages.indexWhere((element) =>
              ((element.currentLocation?.localId?.isNotEmpty ?? false) &&
                  (m.localId?.isNotEmpty ?? false) &&
                  element.currentLocation?.localId == m.localId) ||
              ((element.currentLocation?.messageId?.isNotEmpty ?? false) &&
                  (m.messageId?.isNotEmpty ?? false) &&
                  (element.currentLocation?.messageId == m.messageId)));
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

      case 'voice':
        final m = VoiceMessage.fromJson(decodedMessage, uid: uid);
        final mess = Message(
            localId: decodedMessage['local_id'] as String?,
            deleted: (decodedMessage['deleted'] as bool?) ?? false,
            voiceMessage: m,
            sender: m.sender,
            messageId: m.messageId,
            messageType: m.messageType,
            taskId: chatTaskId,
            timestamp: m.timestamp);
        if (fromSend) {
          insertMessageToList(mess);
        } else {
          final index = messages.indexWhere((element) =>
              ((element.voiceMessage?.localId?.isNotEmpty ?? false) &&
                  (m.localId?.isNotEmpty ?? false) &&
                  element.voiceMessage?.localId == m.localId) ||
              ((element.voiceMessage?.messageId?.isNotEmpty ?? false) &&
                  (m.messageId?.isNotEmpty ?? false) &&
                  (element.voiceMessage?.messageId == m.messageId)));
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
      GoRouter.of(context).pop();
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
        if (e.file != null) {
          print('file from local db ---> ${e.file?.filePath}');
        }
        final index = messages.indexWhere((element) =>
            ((element.localId?.isNotEmpty ?? false) &&
                (e.localId?.isNotEmpty ?? false) &&
                element.localId == e.localId) ||
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

  /// get time string by substract 5 hr 30 min for local use
  String _getTimeString() => DateTime.now()
      .add(const Duration(hours: -5, minutes: -30))
      .toIso8601String();

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
          timestamp: _getTimeString(),
        );
        addMessageToChannel(
            data: {"message_type": "text", "message": text},
            message: textMessage.toJson());
        controller.clear();
        firstLoad = false;
      } catch (e) {
        log('Failed to send message: $e');
        _error = 'Failed to send message: $e';
      }
    }
  }

  /// create poll voting
  void createPollVoting({required CreatePoll createPoll}) {
    try {
      String localId = getUniqueId();
      // create a model for showing it to the ui before sending it to server
      var poll = Poll(
        activeUntil: createPoll.activeUntil,
        anonymousVote: createPoll.isAnonymousVotingAllowed,
        currentUid: _uid,
        isLoadMore: false,
        localId: localId,
        messageType: 'poll',
        multipleAnswer: createPoll.isMultipleSelectionAllowed,
        readBy: [],
        readByAll: false,
        sender: true,
        userId: _uid,
        pollQuestion: createPoll.question,
        timestamp: _getTimeString(),
        resonRequired: createPoll.isReasonRequired,
        pollAnswers: List.generate(
            createPoll.answers?.length ?? 0, (index) => PollAnswer()),
      );
      createPoll.localId = localId;
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
      addMessageToChannel(data: votePoll.toJson());
      controller.clear();
      firstLoad = false;
    } catch (e) {
      log('Failed to create poll: $e');
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
      var timeExpence = TimeExpense(
          isLoadMore: false,
          localId: localId,
          sender: true,
          userId: _uid,
          readByAll: false,
          messageType: 'time_expense',
          timestamp: _getTimeString(),
          timeExpenseData: TimeExpenseData(
            description: timeExpenceUpdation.description,
            time: timeExpenceUpdation.time,
            expense: timeExpenceUpdation.expense,
            userId: _uid,
          ));
      addMessageToChannel(
        data: timeExpenceUpdation.toJson(),
        message: timeExpence.toJson(),
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
      String? filePath = await pathProvider.copyFileToPath(
          path: '$chatTaskId/chat/file',
          file: loadedImages[0].fileImage!,
          module: Module.task);

      // create a model for showing it to the ui before sending it to server
      var file = FileMessage(
        localId: localId,
        currentUid: _uid,
        file: loadedImages[0].base64 ?? '',
        fileType: 'image',
        timestamp: _getTimeString(),
        isLoadMore: false,
        messageType: 'file',
        readByAll: false,
        sender: true,
        message: controller.text.trim(),
        userId: _uid,
        filePath: filePath,
      );
      print('send picture -> ${loadedImages.first.type}');
      final data = {
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
      };
      addMessageToChannel(data: data, message: file.toJson());
      controller.clear();
      loadedImages.clear();
    } catch (e) {
      print('Failed to send image: $e');
      _error = 'Failed to send image: $e';
      return;
    }
  }

  void downloadFile(String? messageId) async {
    if (messageId?.isNotEmpty ?? false) {
      downloadingMessagesFilesId.add(messageId!);
    } else {
      return;
    }
    Message message = messages.firstWhere((m) => m.messageId == messageId);
    String? filePath = await pathProvider.downloadSaveToFileAndReturnPath(
        path: 'chat/$chatTaskId/file',
        module: Module.task,
        urlPath: message.file?.file ?? '');
    message.file?.filePath = filePath;
    final index = messages.indexWhere((m) => m.messageId == messageId);
    if (index != -1 && index != null) {
      messages[index] = message;
      update(['chat']);
    }
    downloadingMessagesFilesId.remove(messageId);
    print('downloaded message => ${message.toJson().toString()}');
    await taskChatLocalService.insertOrUpdateMessage(message: message);
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
      String? filePath = await pathProvider.copyFileToPath(
          path: 'chat/$chatTaskId/file', file: pdf.file!, module: Module.task);
      var file = FileMessage(
          currentUid: _uid,
          userId: _uid,
          file: base64,
          fileType: 'pdf',
          messageType: 'file',
          isLoadMore: false,
          sender: true,
          readByAll: false,
          localId: localId,
          timestamp: _getTimeString(),
          filePath: filePath,
          message: filePath?.split('/').last);
      print('send pdf => ${pdf.name}');
      final data = {
        "message_type": "file",
        "files": [
          {"file": base64, "file_type": 'pdf'}
        ],
        "messages": [pdf.name ?? 'Document']
      };
      addMessageToChannel(
        data: data,
        message: file.toJson(),
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
      var currentLocation = CurrentLocationMessage(
        currentUid: _uid,
        isLoadMore: false,
        localId: localId,
        location: currentLocationLatLong,
        place: this.currentLocation.value,
        messageType: 'location',
        timestamp: _getTimeString(),
        sender: true,
        userId: _uid,
        readByAll: false,
      );
      addMessageToChannel(
        data: {
          "message_type": "location",
          "location": currentLocationLatLong,
          "place": this.currentLocation.value
        },
        message: currentLocation.toJson(),
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
    String duration =
        DateTimeFormater.getDurtionFromSeconds(recordDuration.value);
    // create a model for showing it to the ui before sending it to server
    var voiceMessage = VoiceMessage(
      currentUid: _uid,
      localId: localId,
      duration: duration,
      isLoadMore: false,
      messageType: 'voice',
      readByAll: false,
      sender: true,
      userId: _uid,
      voice: recordedAudio.value,
      timestamp: _getTimeString(),
    );
    addMessageToChannel(
      data: {
        "message_type": "voice",
        "voice_message": recordedAudio.value,
        "duration": duration
      },
      message: voiceMessage.toJson(),
    );
    recordedAudio.value = '';
  }
}
