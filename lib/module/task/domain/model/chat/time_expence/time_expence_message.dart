class TimeExpense {
  String? messageType;
  String? message;
  String? userId;
  String? username;
  String? profilePicture;
  String? messageId;
  String? timestamp;
  String? localId;
  TimeExpenseData? timeExpenseData;
  bool? readByAll;
  bool sender;
  bool isLoadMore;
  String? timeExpenseId;
  String? timeExpenseEntryId;

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
    this.localId,
    this.timeExpenseEntryId,
    this.timeExpenseId,
    this.sender = false,
    this.isLoadMore = false,
  });

  /// send [fromLocalDb] true to make [TimeExpenseData] from the same json
  /// if [TimeExpenseData] is inside key 'time_expence_data' dont need to pass any bool
  /// pass [fromLocalDb] for make model form json from local db
  factory TimeExpense.fromJson(Map<String, dynamic> json,
      {String? uid, bool fromLocalDb = false}) {
    return TimeExpense(
      localId: json['local_id'] as String?,
      messageType: json['message_type'] as String?,
      message: json['message'] as String?,
      userId: json['user_id'] as String?,
      username: json['username'] as String?,
      profilePicture: json['profile_picture'] as String?,
      messageId: json['message_id'] as String?,
      timestamp: json['timestamp'] as String?,
      timeExpenseEntryId: json['time_expense_entry_id'] as String?,
      timeExpenseId: json['time_expense_id'] as String?,
      timeExpenseData: fromLocalDb
          // make timeexpence data form local data
          ? TimeExpenseData.fromJson(json)
          // make timeexpende data form socket data
          : json['time_expense_data'] != null
              ? TimeExpenseData.fromJson(
                  json['time_expense_data'] as Map<String, dynamic>)
              : null,
      readByAll: fromLocalDb
          ? (json['read_by_all'] as int?) == 1
          : json['read_by_all'] as bool?,
      sender: (json['user_id'] as String?) == uid,
      isLoadMore: fromLocalDb
          ? (json['is_load_more'] as int?) == 1
          : (json['is_load_more'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'local_id': localId,
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
      'is_load_more': isLoadMore,
      'time_expense_entry_id': timeExpenseEntryId,
      'time_expense_id': timeExpenseId,
    };
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
  static const String colTimeExpenseData = 'time_expense_data';
  static const String colReadByAll = 'read_by_all';
  static const String colSender = 'sender';
  static const String colIsLoadMore = 'is_load_more';
  static const String colTimeExpenceEntryId = 'time_expense_entry_id';
  static const String colTimeExpenceId = 'time_expense_id';

  /// [TimeExpenseData] items
  static const String colId = '_id';
  static const String colUserName = 'user_name';
  static const String colTaskId = 'task_id';
  static const String colTime = 'time';
  static const String colExpense = 'expense';
  static const String colDescription = 'description';
  static const String colStartDate = 'start_date';
  static const String colEndDate = 'end_date';
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
