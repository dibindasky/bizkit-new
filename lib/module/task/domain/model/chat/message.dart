
class Message {
  final String? messageType;
  final String? userId;
  final String? username;
  final String? profilePicture;
  final String? timestamp;
  final String? messageId;
  final String? message;
  final bool sender;
  final String? pollId;
  final String? pollQuestion;
  final List<PollAnswer>? pollAnswers;

  Message({
    this.messageType,
    this.userId,
    this.username,
    this.profilePicture,
    this.timestamp,
    this.messageId,
    this.message,
    this.sender = false,
    this.pollId,
    this.pollQuestion,
    this.pollAnswers,
  });

  // Convert a Message instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'message_type': messageType,
      'user_id': userId,
      'username': username,
      'profile_picture': profilePicture,
      'message_id': messageId,
      'message': message,
      'timestamp': timestamp,
      'sender': sender,
      'poll_id': pollId,
      'poll_question': pollQuestion,
      'poll_answers': pollAnswers?.map((answer) => answer.toJson()).toList(),
    };
  }

  // Create a Message instance from a Map
  factory Message.fromJson(Map<String, dynamic> json, [String? uid]) {
    return Message(
      messageType: json['message_type'] as String?,
      userId: json['user_id'] as String?,
      username: json['username'] as String?,
      profilePicture: json['profile_picture'] as String?,
      messageId: json['message_id'] as String?,
      message: json['message'] as String?,
      timestamp: json['timestamp'] as String?,
      sender: (json['user_id'] as String?) == uid,
      pollId: json['poll_id'] as String?,
      pollQuestion: json['poll_question'] as String?,
      pollAnswers: (json['poll_answers'] as List<dynamic>?)
          ?.map((item) => PollAnswer.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class PollAnswer {
  final String? answerId;
  final String? answerText;
  final int? answerVotes;

  PollAnswer({
    this.answerId,
    this.answerText,
    this.answerVotes,
  });

  // Convert a PollAnswer instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'answer_id': answerId,
      'answer_text': answerText,
      'answer_votes': answerVotes,
    };
  }

  // Create a PollAnswer instance from a Map
  factory PollAnswer.fromJson(Map<String, dynamic> json) {
    return PollAnswer(
      answerId: json['answer_id'] as String?,
      answerText: json['answer_text'] as String?,
      answerVotes: json['answer_votes'] as int?,
    );
  }
}
