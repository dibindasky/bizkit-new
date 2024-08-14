class TextMessage {
  final String? messageType;
  final String? userId;
  final String? currentUid;
  final String? username;
  final String? profilePicture;
  final String? timestamp;
  final String? messageId;
  final String? message;
  final bool sender;
  final List<String>? readBy; // Added field

  TextMessage({
    this.messageType,
    this.userId,
    this.currentUid,
    this.username,
    this.profilePicture,
    this.timestamp,
    this.messageId,
    this.message,
    this.sender = false,
    this.readBy, // Added field
  });

  // Convert a Message instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'message_type': messageType,
      'user_id': userId,
      'current_uid': currentUid,
      'username': username,
      'profile_picture': profilePicture,
      'message_id': messageId,
      'message': message,
      'timestamp': timestamp,
      'sender': sender,
      'read_by': readBy, // Added field
    };
  }

  // Create a Message instance from a Map
  factory TextMessage.fromJson(Map<String, dynamic> json, [String? uid]) {
    return TextMessage(
      messageType: json['message_type'] as String?,
      userId: json['user_id'] as String?,
      currentUid: uid,
      username: json['username'] as String?,
      profilePicture: json['profile_picture'] as String?,
      messageId: json['message_id'] as String?,
      message: json['message'] as String?,
      timestamp: json['timestamp'] as String?,
      sender: (json['user_id'] as String?) == uid,
      readBy: (json['read_by'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(), // Added field
    );
  }
}

