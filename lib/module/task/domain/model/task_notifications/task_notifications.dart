class TaskNotification {
  final String? id;
  final String? userId;
  final String? taskId;
  final String? message;
  final String? createdAt;
  final String? updatedAt;
  final bool? isRead;
  final String? notificationType;
  final bool? isNewTask;
  final String? taskTitle; // Added field
  final String? title; // Added field

  TaskNotification({
    this.title,
    this.id,
    this.userId,
    this.taskId,
    this.message,
    this.createdAt,
    this.updatedAt,
    this.isRead,
    this.notificationType,
    this.isNewTask,
    this.taskTitle, // Initialize the new field
  });

  factory TaskNotification.fromJson(Map<String, dynamic> json) {
    return TaskNotification(
      id: json['_id'] != null && json['_id'].isNotEmpty ? json['_id'] : null,
      userId: json['user_id'] != null && json['user_id'].isNotEmpty ? json['user_id'] : null,
      taskId: json['task_id'] != null && json['task_id'].isNotEmpty ? json['task_id'] : null,
      message: json['message'] != null && json['message'].isNotEmpty ? json['message'] : null,
      createdAt: json['created_at'] != null && json['created_at'].isNotEmpty ? json['created_at'] : null,
      updatedAt: json['updated_at'] != null && json['updated_at'].isNotEmpty ? json['updated_at'] : null,
      isRead: json['is_read'],
      notificationType: json['notification_type'] != null && json['notification_type'].isNotEmpty ? json['notification_type'] : null,
      isNewTask: json['is_new_task'],
      taskTitle: json['task_title'] != null && json['task_title'].isNotEmpty ? json['task_title'] : null, // Handle task_title
      title: json['title'] != null && json['title'].isNotEmpty ? json['title'] : null, // Handle title
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) '_id': id,
      if (userId != null) 'user_id': userId,
      if (taskId != null) 'task_id': taskId,
      if (message != null) 'message': message,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isRead != null) 'is_read': isRead,
      if (notificationType != null) 'notification_type': notificationType,
      if (isNewTask != null) 'is_new_task': isNewTask,
      if (taskTitle != null) 'task_title': taskTitle, // Include task_title if not null
      if (title != null) 'title': title, // Include title if not null
    };
  }
}
