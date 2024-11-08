class TimeExpenseUpdation {
  final String? messageType;
  final String? time;
  final String? expense;
  final String? description;

  TimeExpenseUpdation({
    this.messageType,
    this.time,
    this.expense,
    this.description,
  });

  factory TimeExpenseUpdation.fromJson(Map<String, dynamic> json) {
    return TimeExpenseUpdation(
      messageType: json['message_type'] as String?,
      time: json['time'] as String?,
      expense: json['expense'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message_type': 'time_expense_updation',
      'time': time,
      'expense': expense,
      'description': description,
    };
  }
}
