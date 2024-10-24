class TextMessage {
  String? messageType;
  String? userId;
  String? currentUid;
  String? username;
  String? profilePicture;
  String? timestamp;
  String? messageId;
  String? message;
  bool sender;
  bool isLoadMore;
  bool readByAll;
  List<String>? readBy;

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
    this.readBy,
    this.isLoadMore = false,
    this.readByAll = false,
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
      'read_by': readBy,
      'is_load_more': isLoadMore,
      'read_by_all': readByAll,
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
      isLoadMore: (json['is_load_more'] as bool?) ?? false,
      sender: (json['user_id'] as String?) == uid,
      readBy: (json['read_by'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      readByAll: (json['read_by_all'] as bool?) ?? false,
    );
  }

  static const String colLocalId = 'local_id';
  static const String colMessageType = 'message_type';
  static const String colUserId = 'user_id';
  static const String colCurrentUid = 'current_uid';
  static const String colUsername = 'username';
  static const String colProfilePicture = 'profile_picture';
  static const String colMessageId = 'message_id';
  static const String colMessage = 'message';
  static const String colTimestamp = 'timestamp';
  static const String colSender = 'sender';
  static const String colReadBy = 'read_by';
  static const String colIsLoadMore = 'is_load_more';
  static const String colReadByAll = 'read_by_all';
}
