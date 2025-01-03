import 'package:bizkit/module/task/domain/model/chat/poll/poll_supporter.dart';

class PollAnswer {
  String? answerId;
  String? answerText;
  int? answerVotes;
  List<Supporter>? supporters;
  String? messageId;
  String? localId;

  PollAnswer({
    this.answerId,
    this.answerText,
    this.answerVotes,
    this.supporters,
    this.messageId,
    this.localId,
  });

  PollAnswer copyWith({
    String? answerId,
    String? answerText,
    int? answerVotes,
    List<Supporter>? supporters,
    String? messageId,
    String? localId,
  }) {
    return PollAnswer(
      answerId: answerId ?? this.answerId,
      answerText: answerText ?? this.answerText,
      answerVotes: answerVotes ?? this.answerVotes,
      supporters: supporters ?? this.supporters,
      messageId: messageId ?? this.messageId,
      localId: localId ?? this.localId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer_id': answerId,
      'answer_text': answerText,
      'answer_votes': answerVotes,
      'supporters': supporters?.map((supporter) => supporter.toJson()).toList(),
      'message_id': messageId,
      'local_id': localId
    };
  }

  factory PollAnswer.fromJson(
      Map<String, dynamic> json, String messageId, String localId) {
    return PollAnswer(
      answerId: json['answer_id'] as String?,
      answerText: json['answer_text'] as String?,
      answerVotes: json['answer_votes'] as int?,
      supporters: (json['supporters'] as List<dynamic>?)
          ?.map((item) => Supporter.fromJson(item as Map<String, dynamic>,
              messageId: messageId,
              answerId: (json['answer_id'] as String?) ?? ''))
          .toList(),
      messageId: messageId,
      localId: localId,
    );
  }

  @override
  String toString() {
    return 'PollAnswer(answerId: $answerId, answerText: $answerText, answerVotes: $answerVotes, supporters: $supporters, message_id: $messageId)';
  }

  static const String colLocalId = 'local_id';
  static const String colLocalDbId = 'local_db_id';
  static const String colPollId = 'poll_local_id';
  static const String colAnswerId = 'answer_id';
  static const String colAnswerText = 'answer_text';
  static const String colAnswerVotes = 'answer_votes';
  static const String colSupporters = 'supporters';
  static const String colMessageId = 'message_id';
}
