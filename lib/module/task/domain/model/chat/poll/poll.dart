import 'package:bizkit/module/task/domain/model/chat/poll/poll_answer.dart';

class Poll {
  bool sender;
  String? localId;
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
  String? messageType;
  bool isLoadMore;
  bool readByAll;

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
    this.messageType,
    this.localId,
    this.isLoadMore = false,
    this.readByAll = false,
  });

  Poll copyWith({
    bool? sender,
    String? pollId,
    String? currentUid,
    String? messageId,
    String? pollQuestion,
    List<PollAnswer>? pollAnswers,
    String? timestamp,
    String? userName,
    String? profilePicture,
    String? userId,
    List<String>? readBy,
    bool? multipleAnswer,
    bool? anonymousVote,
    bool? resonRequired,
    String? activeUntil,
    String? messageType,
    bool? isLoadMore,
    bool? readByAll,
    String? localId,
  }) {
    return Poll(
      sender: sender ?? this.sender,
      pollId: pollId ?? this.pollId,
      currentUid: currentUid ?? this.currentUid,
      messageId: messageId ?? this.messageId,
      pollQuestion: pollQuestion ?? this.pollQuestion,
      pollAnswers: pollAnswers ?? this.pollAnswers,
      timestamp: timestamp ?? this.timestamp,
      userName: userName ?? this.userName,
      profilePicture: profilePicture ?? this.profilePicture,
      userId: userId ?? this.userId,
      readBy: readBy ?? this.readBy,
      multipleAnswer: multipleAnswer ?? this.multipleAnswer,
      anonymousVote: anonymousVote ?? this.anonymousVote,
      resonRequired: resonRequired ?? this.resonRequired,
      activeUntil: activeUntil ?? this.activeUntil,
      isLoadMore: isLoadMore ?? this.isLoadMore,
      readByAll: readByAll ?? this.readByAll,
      messageType: messageType ?? this.messageType,
      localId: localId ?? this.localId,
    );
  }

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
      'is_load_more': isLoadMore,
      'read_by_all': readByAll,
      'message_type': messageType,
      'local_id': localId,
    };
  }

  factory Poll.fromJson(Map<String, dynamic> json,
      {String? uid, bool fromLocalDb = false}) {
    return Poll(
      sender: (json['user_id'] as String?) == uid,
      pollId: json['poll_id'] as String?,
      messageId: json['message_id'] as String?,
      localId: json['local_id'] as String?,
      currentUid: uid,
      pollQuestion: json['poll_question'] as String?,
      pollAnswers: (json['poll_answers'] as List<dynamic>?)
          ?.map((item) => PollAnswer.fromJson(
              item as Map<String, dynamic>,
              (json['message_id'] as String?) ?? '',
              (json['local_id'] as String?) ?? ''))
          .toList(),
      timestamp: json['timestamp'] as String?,
      userName: json['username'] as String?,
      profilePicture: json['profile_picture'] as String?,
      userId: json['user_id'] as String?,
      readBy: fromLocalDb
          ? ((json['read_by'] as String?) ?? '').isEmpty
              ? null
              : (json['read_by'] as String).split(',')
          : (json['read_by'] as List<dynamic>?)
              ?.map((item) => item as String)
              .toList(),
      activeUntil: json['active_until'] as String?,
      messageType: json['message_type'] as String?,
      multipleAnswer: fromLocalDb
          ? (json['is_multiple_selection_allowed'] as int?) == 1
          : json['is_multiple_selection_allowed'] as bool?,
      anonymousVote: fromLocalDb
          ? (json['is_anonymous_voting_allowed'] as int?) == 1
          : json['is_anonymous_voting_allowed'] as bool?,
      resonRequired: fromLocalDb
          ? (json['is_reason_required'] as int?) == 1
          : json['is_reason_required'] as bool?,
      isLoadMore: fromLocalDb
          ? (json['is_load_more'] as int?) == 1
          : (json['is_load_more'] as bool?) ?? false,
      readByAll: fromLocalDb
          ? (json['read_by_all'] as int?) == 1
          : (json['read_by_all'] as bool?) ?? false,
    );
  }

  @override
  String toString() {
    return 'Poll(sender: $sender, pollId: $pollId, currentUid: $currentUid, messageId: $messageId, pollQuestion: $pollQuestion, pollAnswers: $pollAnswers, timestamp: $timestamp, userName: $userName, profilePicture: $profilePicture, userId: $userId, readBy: $readBy, multipleAnswer: $multipleAnswer, anonymousVote: $anonymousVote, resonRequired: $resonRequired, activeUntil: $activeUntil, isLoadMore: $isLoadMore, readByAll: $readByAll, local_db_id: $localId)';
  }

  static const String colLocalId = 'local_id';
  static const String colLocalDbId = 'local_db_id';
  static const String colSender = 'sender';
  static const String colPollId = 'poll_id';
  static const String colMessageId = 'message_id';
  static const String colCurrentUid = 'current_uid';
  static const String colPollQuestion = 'poll_question';
  static const String colPollAnswers = 'poll_answers';
  static const String colTimestamp = 'timestamp';
  static const String colUserName = 'username';
  static const String colProfilePicture = 'profile_picture';
  static const String colUserId = 'user_id';
  static const String colReadBy = 'read_by';
  static const String colActiveUntil = 'active_until';
  static const String colMultipleAnswer = 'is_multiple_selection_allowed';
  static const String colAnonymousVote = 'is_anonymous_voting_allowed';
  static const String colResonRequired = 'is_reason_required';
  static const String colIsLoadMore = 'is_load_more';
  static const String colReadByAll = 'read_by_all';
  static const String colMessageType = 'message_type';
}
