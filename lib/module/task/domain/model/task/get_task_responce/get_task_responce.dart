import 'package:bizkit/module/task/domain/model/task/get_task_responce/created_user_details.dart';
import 'package:json_annotation/json_annotation.dart';

import 'assigned_to_detail.dart';
import 'attachment.dart';
import 'sub_task.dart';

part 'get_task_responce.g.dart';

@JsonSerializable()
class GetTaskResponce {
  // Local ID
  int? localId;

  String? taskType;
  bool? spotlightOn;
  bool? isPinned;

  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'created_by')
  String? createdBy;
  String? title;
  String? description;
  @JsonKey(name: 'priority_level')
  String? priorityLevel;
  @JsonKey(name: 'recurrent_task')
  bool? recurrentTask;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;
  @JsonKey(name: 'is_owned')
  bool? isOwned;
  @JsonKey(name: 'dead_line')
  String? deadLine;
  @JsonKey(name: 'is_killed')
  bool? isKilled;
  List<String>? tags;
  List<Attachment>? attachments;
  @JsonKey(name: 'sub_task')
  List<SubTask>? subTask;
  @JsonKey(name: 'created_at')
  String? createdAt;
  String? status;
  @JsonKey(name: 'created_user_details')
  CreatedUserDetails? createdUserDetails;
  @JsonKey(name: 'assigned_to_details')
  List<AssignedToDetail>? assignedToDetails;
  @JsonKey(name: 'total_time')
  int? totalTime;
  @JsonKey(name: 'total_expense')
  int? totalExpense;

  GetTaskResponce(
      {this.id,
      this.createdBy,
      this.title,
      this.description,
      this.priorityLevel,
      this.recurrentTask,
      this.isCompleted,
      this.deadLine,
      this.isKilled,
      this.tags,
      this.attachments,
      this.subTask,
      this.createdAt,
      this.status,
      this.isOwned,
      this.assignedToDetails,
      this.totalExpense,
      this.totalTime});

  factory GetTaskResponce.fromJson(Map<String, dynamic> json) {
    return _$GetTaskResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetTaskResponceToJson(this);

  static const colTaskLocalId = 'task_local_id';

  static const colUserId = 'user_id';
  static const colTaskId = 'task_id';
  static const colTaskCreatedBy = 'task_created_by';
  static const colTaskTitle = 'task_title';
  static const colTaskDescription = 'task_description';
  static const colTaskPriorityLevel = 'task_priority_level';
  static const colTaskRecurrentTask = 'task_recurrent_task';
  static const colTaskIsCompleted = 'task_is_completed';
  static const colTaskIsOwned = 'task_is_owned';
  static const colTaskDeadLine = 'task_dead_line';
  static const colTaskIsKilled = 'task_is_killed';
  static const colTaskTags = 'task_tags';
  static const colTaskCreatedAt = 'task_created_at';
  static const colTaskStatus = 'task_status';

  /// [ Task created user details ]
  static const colTaskCreatedUserId = 'task_created_user_id';
  static const colTaskCreatedUsername = 'task_created_username';
  static const colTaskCreatedUserProfilePic =
      'task_created_user_profile_picture';

  static const colTaskTotalTime = 'task_total_time';
  static const colTaskTotalExpense = 'task_total_expense';

  static const colTaskType = 'task_type';
  static const colTaskSpotlightOn = 'task_spotlight_on';
  static const colTaskIsPinned = 'task_is_pinned';
}
