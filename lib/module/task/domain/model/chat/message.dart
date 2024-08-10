class Message {
  final String? messageType;
  final String? userId;
  final String? username;
  final String? profilePicture;
  final String? timestamp;
  final String? messageId;
  final String? message;
  final bool sender;

  Message({
    this.messageType,
    this.userId,
    this.username,
    this.profilePicture,
    this.timestamp,
    this.messageId,
    this.message,
    this.sender = false,
  });

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
    );
  }

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
    };
  }
}
