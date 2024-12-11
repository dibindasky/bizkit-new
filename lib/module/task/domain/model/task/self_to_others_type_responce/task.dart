import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:bizkit/module/task/domain/model/task/self_to_others_type_responce/sub_task.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../folders/inner_folder/get_all_tasks_inner_folder_responce/created_by.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  @JsonKey(name: 'task_id')
  String? id;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'task_title')
  String? title;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'dead_line')
  String? deadLine;
  @JsonKey(name: 'priority_level')
  String? priorityLevel;
  @JsonKey(name: 'subtasks')
  List<SubTask>? subtasks;
  @JsonKey(name: 'task_type')
  String? taskType;
  @JsonKey(name: 'is_owned')
  bool? isOwned;
  @JsonKey(name: 'spotlight_on')
  bool? spotlightOn;
  @JsonKey(name: 'is_pinned')
  bool? isPinned;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'created_by')
  CreatedBy? createdBy;
  @JsonKey(name: 'matched_next_action_dates')
  List<String>? matchedNextActionDates;

  Task(
      {this.id,
      this.taskType,
      this.isOwned,
      this.spotlightOn,
      this.isPinned,
      this.createdAt,
      this.deadLine,
      this.description,
      this.priorityLevel,
      this.subtasks,
      this.title,
      this.status,
      this.createdBy,
      this.matchedNextActionDates});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  Task copyWith(
      {String? id,
      String? description,
      String? title,
      String? createdAt,
      String? deadLine,
      String? priorityLevel,
      List<SubTask>? subtasks,
      String? taskType,
      bool? isOwned,
      bool? spotlightOn,
      bool? isPinned,
      String? status,
      CreatedBy? createdBy,
      List<String>? matchedNextActionDates}) {
    return Task(
      id: id ?? this.id,
      description: description ?? this.description,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      deadLine: deadLine ?? this.deadLine,
      priorityLevel: priorityLevel ?? this.priorityLevel,
      subtasks: subtasks ?? this.subtasks,
      taskType: taskType ?? this.taskType,
      isOwned: isOwned ?? this.isOwned,
      spotlightOn: spotlightOn ?? this.spotlightOn,
      isPinned: isPinned ?? this.isPinned,
      status: status ?? this.status,
      createdBy: createdBy ?? this.createdBy,
      matchedNextActionDates:
          matchedNextActionDates ?? this.matchedNextActionDates,
    );
  }

  static Task fromMap(Map<String, Object?> map) {
    return Task(
        id: map[GetTaskResponce.colTaskId] as String?,
        description: map[GetTaskResponce.colTaskDescription] as String?,
        title: map[GetTaskResponce.colTaskTitle] as String?,
        createdAt: map[GetTaskResponce.colTaskCreatedAt] as String?,
        deadLine: map[GetTaskResponce.colTaskDeadLine] as String?,
        priorityLevel: map[GetTaskResponce.colTaskPriorityLevel] as String?,
        taskType: map[GetTaskResponce.colTaskType] as String?,
        isOwned: (map[GetTaskResponce.colTaskIsOwned] as int?) == 1,
        spotlightOn: (map[GetTaskResponce.colTaskSpotlightOn] as int?) == 1,
        isPinned: (map[GetTaskResponce.colTaskIsPinned] as int?) == 1,
        status: map[GetTaskResponce.colTaskStatus] as String?,
        createdBy: CreatedBy(
          name: map[GetTaskResponce.colTaskCreatedUsername] as String?,
          userId: map[GetTaskResponce.colTaskCreatedUserId] as String?,
        ),
        matchedNextActionDates:
            (map[GetTaskResponce.colNextActionDate] as String?)?.split(','));
  }
}
