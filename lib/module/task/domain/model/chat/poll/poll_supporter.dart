class Supporter {
  final String? userId;
  final String? name;
  final String? profilePicture;
  final String? reason;
  final String? messageId;
  final String? answerId;

  Supporter({
    this.userId,
    this.name,
    this.profilePicture,
    this.reason,
    this.messageId,
    this.answerId,
  });

  Supporter copyWith({
    String? userId,
    String? name,
    String? profilePicture,
    String? reason,
    String? messageId,
    String? answerId,
  }) {
    return Supporter(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture,
      reason: reason ?? this.reason,
      messageId: messageId ?? this.messageId,
      answerId: answerId ?? this.answerId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name': name,
      'profile_picture': profilePicture,
      'reason': reason,
      'message_id': messageId,
      'answer_id': answerId,
    };
  }

  factory Supporter.fromJson(
      Map<String, dynamic> json, {String? messageId, String? answerId}) {
    return Supporter(
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      profilePicture: json['profile_picture'] as String?,
      reason: json['reason'] as String?,
      messageId: messageId,
      answerId: answerId,
    );
  }

  @override
  String toString() {
    return 'Supporter(userId: $userId, name: $name, profilePicture: $profilePicture, reason: $reason, message_id: $messageId)';
  }

  static const String colLocalId = 'local_id';
  static const String colAnswerId = 'poll_answer_id';
  static const String colUserId = 'user_id';
  static const String colName = 'name';
  static const String colProfilePicture = 'profile_picture';
  static const String colReason = 'reason';
  static const String colMessageId = 'message_id';
}
