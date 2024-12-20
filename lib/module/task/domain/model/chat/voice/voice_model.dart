class VoiceMessage {
  final String? messageType;
  final String? localId;
  final String? message;
  final String? userId;
  final String? username;
  final String? profilePicture;
  final String? messageId;
  final String? timestamp;
  final String? voice;
  final String? duration;
  final String? currentUid;
  final bool? readByAll;
  final bool sender;
  final bool isLoadMore;

  VoiceMessage(
      {this.messageType,
      this.message,
      this.userId,
      this.username,
      this.profilePicture,
      this.messageId,
      this.timestamp,
      this.voice,
      this.duration,
      this.readByAll,
      this.currentUid,
      this.localId,
      this.isLoadMore = false,
      this.sender = false});

  // Factory constructor to create an instance from a JSON map
  factory VoiceMessage.fromJson(Map<String, dynamic> json,
      {String? uid, bool fromLocalDb = false}) {
    return VoiceMessage(
      messageType: json['message_type'] as String?,
      message: json['message'] as String?,
      userId: json['user_id'] as String?,
      localId: json['local_id'] as String?,
      username: json['username'] as String?,
      profilePicture: json['profile_picture'] as String?,
      messageId: json['message_id'] as String?,
      timestamp: json['timestamp'] as String?,
      voice: json['voice_data_base64'] as String?,
      readByAll: fromLocalDb
          ? (json['read_by_all'] as int?) == 1
          : json['read_by_all'],
      duration: json['duration'] as String,
      isLoadMore: (json['is_load_more'] as bool?) ?? false,
      currentUid: uid,
      sender: (json['user_id'] as String?) == uid,
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'message_type': messageType,
      'message': message,
      'user_id': userId,
      'username': username,
      'profile_picture': profilePicture,
      'message_id': messageId,
      'timestamp': timestamp,
      'voice_data_base64': voice,
      'duration': duration,
      'read_by_all': readByAll,
      'current_uid': currentUid,
      'is_load_more': isLoadMore,
      'local_id': localId
    };
  }

  // Override toString to get a string representation of the instance
  @override
  String toString() {
    return 'VoiceMessage{messageType: $messageType, message: $message, userId: $userId, username: $username, duration: $duration profilePicture: $profilePicture, messageId: $messageId, timestamp: $timestamp, voice_data_base64: $voice, readByAll: $readByAll}';
  }

  static const String colLocalId = 'local_id';
  static const String colLocalDbId = 'local_db_id';
  static const String colMessageType = 'message_type';
  static const String colMessage = 'message';
  static const String colUserId = 'user_id';
  static const String colUsername = 'username';
  static const String colProfilePicture = 'profile_picture';
  static const String colMessageId = 'message_id';
  static const String colTimestamp = 'timestamp';
  static const String colVoice = 'voice_data_base64';
  static const String colDuration = 'duration';
  static const String colReadByAll = 'read_by_all';
  static const String colCurrentUid = 'current_uid';
  static const String colIsLoadMore = 'is_load_more';
  static const String colSender = 'sender';
}
