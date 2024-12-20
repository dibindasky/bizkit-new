class FileMessage {
  String? messageType;
  String? message;
  String? userId;
  String? username;
  String? profilePicture;
  String? messageId;
  String? timestamp;
  String? file;
  String? fileType;
  String? filePath;
  String? currentUid;
  String? localId;
  bool? readByAll;
  bool sender;
  bool isLoadMore;

  FileMessage(
      {this.messageType,
      this.message,
      this.userId,
      this.username,
      this.profilePicture,
      this.messageId,
      this.timestamp,
      this.file,
      this.fileType,
      this.filePath,
      this.readByAll,
      this.currentUid,
      this.localId,
      this.isLoadMore = false,
      this.sender = false});

  // Factory constructor to create an instance from a JSON map
  factory FileMessage.fromJson(Map<String, dynamic> json,
      {String? uid, bool fromLocalDb = false}) {
    return FileMessage(
      localId: json['local_id'] as String?,
      messageType: json['message_type'] as String?,
      message: json['message'] as String?,
      userId: json['user_id'] as String?,
      username: json['username'] as String?,
      profilePicture: json['profile_picture'] as String?,
      messageId: json['message_id'] as String?,
      timestamp: json['timestamp'] as String?,
      file: json['file'] as String?,
      fileType: json['file_type'] as String?,
      filePath: json['file_path'] as String?,
      readByAll: fromLocalDb
          ? (json['read_by_all'] as int?) == 1
          : json['read_by_all'] as bool?,
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
      'file': file,
      'file_type': fileType,
      'file_path': filePath,
      'read_by_all': readByAll,
      'current_uid': currentUid,
      'is_load_more': isLoadMore,
      'local_id': localId,
    };
  }

  // Override toString to get a string representation of the instance
  @override
  String toString() {
    return 'FileMessage{messageType: $messageType, message: $message, userId: $userId, username: $username, profilePicture: $profilePicture, messageId: $messageId, timestamp: $timestamp, file: $file, fileType: $fileType, readByAll: $readByAll}';
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
  static const String colFile = 'file';
  static const String colFilePath = 'file_path';
  static const String colFileType = 'file_type';
  static const String colReadByAll = 'read_by_all';
  static const String colCurrentUid = 'current_uid';
  static const String colSender = 'sender';
}
