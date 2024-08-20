class TimeExpense {
  String? messageType;
  String? message;
  String? userId;
  String? username;
  String? profilePicture;
  String? messageId;
  String? timestamp;
  TimeExpenseData? timeExpenseData;
  bool? readByAll;
  bool? sender;

  TimeExpense({
    this.messageType,
    this.message,
    this.userId,
    this.username,
    this.profilePicture,
    this.messageId,
    this.timestamp,
    this.timeExpenseData,
    this.readByAll,
    this.sender,
  });

  factory TimeExpense.fromJson(Map<String, dynamic> json, [String? uid]) {
    return TimeExpense(
      messageType: json['message_type'] as String?,
      message: json['message'] as String?,
      userId: json['user_id'] as String?,
      username: json['username'] as String?,
      profilePicture: json['profile_picture'] as String?,
      messageId: json['message_id'] as String?,
      timestamp: json['timestamp'] as String?,
      timeExpenseData: json['time_expense_data'] != null
          ? TimeExpenseData.fromJson(json['time_expense_data'] as Map<String, dynamic>)
          : null,
      readByAll: json['read_by_all'] as bool?,
      sender: (json['user_id'] as String?) == uid,
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
      'time_expense_data': timeExpenseData?.toJson(),
      'read_by_all': readByAll,
      'sender': sender,
    };
  }
}

class TimeExpenseData {
  String? id;
  String? userName;
  String? taskId;
  String? time;
  String? expense;
  String? description;
  String? startDate;
  String? endDate;
  String? userId;

  TimeExpenseData({
    this.id,
    this.userName,
    this.taskId,
    this.time,
    this.expense,
    this.description,
    this.startDate,
    this.endDate,
    this.userId,
  });

  factory TimeExpenseData.fromJson(Map<String, dynamic> json) {
    return TimeExpenseData(
      id: json['_id'] as String?,
      userName: json['user_name'] as String?,
      taskId: json['task_id'] as String?,
      time: json['time'] as String?,
      expense: json['expense'] as String?,
      description: json['description'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      userId: json['user_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user_name': userName,
      'task_id': taskId,
      'time': time,
      'expense': expense,
      'description': description,
      'start_date': startDate,
      'end_date': endDate,
      'user_id': userId,
    };
  }
}
