class FileMessage {
  final String? messageType;
  final String? message;
  final String? userId;
  final String? username;
  final String? profilePicture;
  final String? messageId;
  final String? timestamp;
  final String? file;
  final String? fileType;
  final String? currentUid;
  final bool? readByAll;
  final bool sender;
  final bool isLoadMore;

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
      this.readByAll,
      this.currentUid,
      this.isLoadMore = false,
      this.sender = false});

  // Factory constructor to create an instance from a JSON map
  factory FileMessage.fromJson(Map<String, dynamic> json, [String? uid]) {
    return FileMessage(
      messageType: json['message_type'],
      message: json['message'],
      userId: json['user_id'],
      username: json['username'],
      profilePicture: json['profile_picture'],
      messageId: json['message_id'],
      timestamp: json['timestamp'],
      file: json['file'],
      fileType: json['file_type'],
      readByAll: json['read_by_all'],
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
      'read_by_all': readByAll,
      'current_uid': currentUid,
      'is_load_more': isLoadMore,
    };
  }

  // Override toString to get a string representation of the instance
  @override
  String toString() {
    return 'FileMessage{messageType: $messageType, message: $message, userId: $userId, username: $username, profilePicture: $profilePicture, messageId: $messageId, timestamp: $timestamp, file: $file, fileType: $fileType, readByAll: $readByAll}';
  }
}
