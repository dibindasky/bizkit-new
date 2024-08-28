import 'package:bizkit/module/task/domain/model/chat/file_model.dart';
import 'package:bizkit/module/task/domain/model/chat/poll.dart';
import 'package:bizkit/module/task/domain/model/chat/text_message.dart';
import 'package:bizkit/module/task/domain/model/chat/time_expence_message.dart';

class Message {
  TextMessage? textMessage;
  Poll? poll;
  TimeExpense? timeExpence;
  FileMessage? file;
  bool? sender;

  Message({
    this.poll,
    this.textMessage,
    this.timeExpence,
    this.file,
    this.sender,
  });

  // Convert a Message instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'text_message': textMessage?.toJson(),
      'poll': poll?.toJson(),
      'time_expence': timeExpence?.toJson(),
      'file': file?.toJson(),
      'sender': sender,
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
        sender: false);
  }
}
