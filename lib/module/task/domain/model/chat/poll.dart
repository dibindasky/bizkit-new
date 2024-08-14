class Poll {
  bool sender;
  String? pollId;
  String? currentUid;
  String? messageId;
  String? pollQuestion;
  List<PollAnswer>? pollAnswers;
  String? timestamp;
  String? userName;
  String? profilePicture;
  String? userId;
  List<String>? readBy;
  bool? multipleAnswer;
  bool? anonymousVote;
  bool? resonRequired;
  String? activeUntil;

  Poll({
    this.sender = false,
    this.pollId,
    this.currentUid,
    this.pollQuestion,
    this.pollAnswers,
    this.timestamp,
    this.userName,
    this.profilePicture,
    this.userId,
    this.readBy,
    this.messageId,
    this.activeUntil,
    this.anonymousVote,
    this.multipleAnswer,
    this.resonRequired,
  });

  // Convert a Poll instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'poll_id': pollId,
      'message_id': messageId,
      'current_uid': currentUid,
      'poll_question': pollQuestion,
      'poll_answers': pollAnswers?.map((answer) => answer.toJson()).toList(),
      'timestamp': timestamp,
      'username': userName,
      'profile_picture': profilePicture,
      'user_id': userId,
      'read_by': readBy,
      'active_until': activeUntil,
      'is_multiple_selection_allowed': multipleAnswer,
      'is_anonymous_voting_allowed': anonymousVote,
      'is_reason_required': resonRequired,
    };
  }

  // Create a Poll instance from a Map
  factory Poll.fromJson(Map<String, dynamic> json, [String? uid]) {
    return Poll(
      sender: (json['user_id'] as String?) == uid,
      pollId: json['poll_id'] as String?,
      messageId: json['message_id'] as String?,
      currentUid: uid,
      pollQuestion: json['poll_question'] as String?,
      pollAnswers: (json['poll_answers'] as List<dynamic>?)
          ?.map((item) => PollAnswer.fromJson(item as Map<String, dynamic>))
          .toList(),
      timestamp: json['timestamp'] as String?,
      userName: json['username'] as String?,
      profilePicture: json['profile_picture'] as String?,
      userId: json['user_id'] as String?,
      readBy: (json['read_by'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      activeUntil: json['active_until'] as String?,
      multipleAnswer: json['is_multiple_selection_allowed'] as bool?,
      anonymousVote: json['is_anonymous_voting_allowed'] as bool?,
      resonRequired: json['is_reason_required'] as bool?,
    );
  }

  @override
  String toString() {
    return 'Poll(sender: $sender, pollId: $pollId, currentUid: $currentUid, messageId: $messageId, pollQuestion: $pollQuestion, pollAnswers: $pollAnswers, timestamp: $timestamp, userName: $userName, profilePicture: $profilePicture, userId: $userId, readBy: $readBy, multipleAnswer: $multipleAnswer, anonymousVote: $anonymousVote, resonRequired: $resonRequired, activeUntil: $activeUntil)';
  }
}

class PollAnswer {
  final String? answerId;
  final String? answerText;
  final int? answerVotes;
  final List<Supporter>? supporters;

  PollAnswer({
    this.answerId,
    this.answerText,
    this.answerVotes,
    this.supporters,
  });

  // Convert a PollAnswer instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'answer_id': answerId,
      'answer_text': answerText,
      'answer_votes': answerVotes,
      'supporters': supporters?.map((supporter) => supporter.toJson()).toList(),
    };
  }

  // Create a PollAnswer instance from a Map
  factory PollAnswer.fromJson(Map<String, dynamic> json, [String? uid]) {
    return PollAnswer(
      answerId: json['answer_id'] as String?,
      answerText: json['answer_text'] as String?,
      answerVotes: json['answer_votes'] as int?,
      supporters: (json['supporters'] as List<dynamic>?)
          ?.map((item) => Supporter.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'PollAnswer(answerId: $answerId, answerText: $answerText, answerVotes: $answerVotes, supporters: $supporters)';
  }
}

class Supporter {
  final String? userId;
  final String? name;
  final String? profilePicture;
  final String? reason;

  Supporter({
    this.userId,
    this.name,
    this.profilePicture,
    this.reason,
  });

  // Convert a Supporter instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name': name,
      'profile_picture': profilePicture,
      'reason': reason,
    };
  }

  // Create a Supporter instance from a Map
  factory Supporter.fromJson(Map<String, dynamic> json) {
    return Supporter(
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      profilePicture: json['profile_picture'] as String?,
      reason: json['reason'] as String?,
    );
  }

  @override
  String toString() {
    return 'Supporter(userId: $userId, name: $name, profilePicture: $profilePicture, reason: $reason)';
  }
}
