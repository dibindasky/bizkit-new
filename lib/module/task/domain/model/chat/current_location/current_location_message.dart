class CurrentLocationMessage {
  String? messageType;
  String? message;
  String? userId;
  String? username;
  String? profilePicture;
  String? messageId;
  String? timestamp;
  List<double>? location;
  bool? readByAll;
  bool sender;
  bool isLoadMore;
  String? currentUid;
  String? place;

  CurrentLocationMessage(
      {this.messageType,
      this.message,
      this.userId,
      this.username,
      this.profilePicture,
      this.messageId,
      this.timestamp,
      this.location,
      this.readByAll,
      this.sender = false,
      this.currentUid,
      this.isLoadMore = false,
      this.place});

  factory CurrentLocationMessage.fromJson(Map<String, dynamic> json,
      [String? uid]) {
    return CurrentLocationMessage(
      messageType: json['message_type'],
      message: json['message'],
      userId: json['user_id'],
      username: json['username'],
      profilePicture: json['profile_picture'],
      messageId: json['message_id'],
      timestamp: json['timestamp'],
      location:
          json['location'] != null ? List<double>.from(json['location']) : null,
      readByAll: json['read_by_all'],
      sender: (json['user_id'] as String?) == uid,
      isLoadMore: (json['is_load_more'] as bool?) ?? false,
      place: json['place'],
      currentUid: uid,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message_type': messageType,
      'message': message,
      'user_id': userId,
      'username': username,
      'profile_picture': profilePicture,
      'message_id': messageId,
      'timestamp': timestamp,
      'location': location,
      'read_by_all': readByAll,
      'sender': sender,
      'is_load_more': isLoadMore,
      'current_uid': currentUid,
      'place': place,
    };
  }

  static const String colLocalId = 'local_id';
  static const String colMessageType = 'message_type';
  static const String colMessage = 'message';
  static const String colUserId = 'user_id';
  static const String colUsername = 'username';
  static const String colProfilePicture = 'profile_picture';
  static const String colMessageId = 'message_id';
  static const String colTimestamp = 'timestamp';
  static const String colLocation = 'location';
  static const String colReadByAll = 'read_by_all';
  static const String colSender = 'sender';
  static const String colIsLoadMore = 'is_load_more';
  static const String colCurrentUid = 'current_uid';
  static const String colPlace = 'place';
}
