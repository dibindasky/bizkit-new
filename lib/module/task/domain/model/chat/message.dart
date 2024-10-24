import 'package:bizkit/module/task/domain/model/chat/current_location/current_location_message.dart';
import 'package:bizkit/module/task/domain/model/chat/file/file_model.dart';
import 'package:bizkit/module/task/domain/model/chat/poll/poll.dart';
import 'package:bizkit/module/task/domain/model/chat/text/text_message.dart';
import 'package:bizkit/module/task/domain/model/chat/time_expence/time_expence_message.dart';
import 'package:bizkit/module/task/domain/model/chat/voice/voice_model.dart';

class Message {
  TextMessage? textMessage;
  Poll? poll;
  TimeExpense? timeExpence;
  FileMessage? file;
  VoiceMessage? voiceMessage;
  CurrentLocationMessage? currentLocation;
  bool isLoadMore;
  bool? sender;
  String? messageId;
  String? messageType;

  Message({
    this.poll,
    this.textMessage,
    this.timeExpence,
    this.file,
    this.voiceMessage,
    this.currentLocation,
    this.sender,
    this.messageId,
    this.isLoadMore = false,
    this.messageType,
  });

  // Convert a Message instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'text_message': textMessage?.toJson(),
      'poll': poll?.toJson(),
      'time_expence': timeExpence?.toJson(),
      'file': file?.toJson(),
      'current_location': currentLocation?.toJson(),
      'voice': voiceMessage?.toJson(),
      'sender': sender,
      'message_id': messageId,
      'is_load_more': isLoadMore,
      'message_type': messageType,
    };
  }

  // Create a Message instance from a Map
  factory Message.fromJson(Map<String, dynamic> json, [String? uid]) {
    return Message(
      textMessage: json['text_message'] != null
          ? TextMessage.fromJson(json['text_message'] as Map<String, dynamic>)
          : null,
      poll: json['poll'] != null
          ? Poll.fromJson(json['poll'] as Map<String, dynamic>)
          : null,
      timeExpence: json['time_expence'] != null
          ? TimeExpense.fromJson(json['time_expence'] as Map<String, dynamic>)
          : null,
      file: json['file'] != null
          ? FileMessage.fromJson(json['file'] as Map<String, dynamic>)
          : null,
      voiceMessage: json['voice'] != null
          ? VoiceMessage.fromJson(json['voice'] as Map<String, dynamic>)
          : null,
      currentLocation: json['current_location'] != null
          ? CurrentLocationMessage.fromJson(
              json['current_location'] as Map<String, dynamic>)
          : null,
      sender: json['sender'] as bool?,
      messageId: json['message_id'] as String?,
      messageType: json['message_type'] as String?,
      isLoadMore: json['is_load_more'] as bool? ?? false,
    );
  }

  // Get unique ID based on the type of message
  String? getUniqueId() {
    if (textMessage != null) {
      return textMessage?.messageId;
    } else if (poll != null) {
      return poll?.pollId;
    } else if (timeExpence != null) {
      return timeExpence?.messageId;
    } else if (file != null) {
      return file?.messageId;
    } else if (currentLocation != null) {
      return currentLocation?.messageId;
    } else if (voiceMessage != null) {
      return voiceMessage?.messageId;
    }
    return null;
  }

  // Get the unique field name based on the type of message
  String? getUniqueField() {
    if (textMessage != null) {
      return 'text_message';
    } else if (poll != null) {
      return 'poll';
    } else if (timeExpence != null) {
      return 'time_expence';
    } else if (file != null) {
      return 'file';
    } else if (currentLocation != null) {
      return 'current_location';
    } else if (voiceMessage != null) {
      return 'voice';
    }
    return null;
  }

  // Method to check if the message is a load more type
  bool get isLoadMoreMessage {
    return isLoadMore;
  }

  static const String colLocalId = 'local_id';
  static const String colTextMessage = 'text_message';
  static const String colPoll = 'poll';
  static const String colTimeExpense = 'time_expence';
  static const String colFile = 'file';
  static const String colVoiceMessage = 'voice';
  static const String colCurrentLocation = 'current_location';
  static const String colSender = 'sender';
  static const String colMessageId = 'message_id';
  static const String colIsLoadMore = 'is_load_more';
  static const String colMessageType = 'message_type';
}
