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

  GetTaskResponce({
    this.id,
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
    this.totalTime,
    this.createdUserDetails,
  });

  factory GetTaskResponce.fromJson(Map<String, dynamic> json) {
    return _$GetTaskResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetTaskResponceToJson(this);

  bool equals(GetTaskResponce other) {
    return localId == other.localId &&
        taskType == other.taskType &&
        spotlightOn == other.spotlightOn &&
        isPinned == other.isPinned &&
        id == other.id &&
        createdBy == other.createdBy &&
        title == other.title &&
        description == other.description &&
        priorityLevel == other.priorityLevel &&
        recurrentTask == other.recurrentTask &&
        isCompleted == other.isCompleted &&
        isOwned == other.isOwned &&
        deadLine == other.deadLine &&
        isKilled == other.isKilled &&
        _compareStringLists(tags, other.tags) &&
        _compareAttachmentLists(attachments, other.attachments) &&
        _compareSubTaskLists(subTask, other.subTask) &&
        createdAt == other.createdAt &&
        status == other.status &&
        _compareCreatedUserDetails(
            createdUserDetails, other.createdUserDetails) &&
        _compareAssignedToDetailLists(
            assignedToDetails, other.assignedToDetails) &&
        totalTime == other.totalTime &&
        totalExpense == other.totalExpense;
  }

  bool _compareStringLists(List<String>? list1, List<String>? list2) {
    if (list1 == null && list2 == null) return true;
    if (list1 == null || list2 == null || list1.length != list2.length) {
      return false;
    }
    return list1.toSet().difference(list2.toSet()).isEmpty;
  }

  bool _compareAttachmentLists(
      List<Attachment>? list1, List<Attachment>? list2) {
    if (list1 == null && list2 == null) return true;
    if (list1 == null || list2 == null || list1.length != list2.length) {
      return false;
    }

    for (int i = 0; i < list1.length; i++) {
      if (!_compareAttachment(list1[i], list2[i])) {
        return false;
      }
    }
    return true;
  }

  bool _compareAttachment(Attachment? attachment1, Attachment? attachment2) {
    if (attachment1 == null && attachment2 == null) return true;
    if (attachment1 == null || attachment2 == null) return false;

    return attachment1.localId == attachment2.localId &&
        attachment1.attachment == attachment2.attachment &&
        attachment1.type == attachment2.type;
  }

  bool _compareSubTaskLists(List<SubTask>? list1, List<SubTask>? list2) {
    if (list1 == null && list2 == null) return true;
    if (list1 == null || list2 == null || list1.length != list2.length) {
      return false;
    }

    for (int i = 0; i < list1.length; i++) {
      if (!_compareSubTask(list1[i], list2[i])) {
        return false;
      }
    }
    return true;
  }

  bool _compareSubTask(SubTask? subTask1, SubTask? subTask2) {
    if (subTask1 == null && subTask2 == null) return true;
    if (subTask1 == null || subTask2 == null) return false;

    return subTask1.localId == subTask2.localId &&
        subTask1.title == subTask2.title &&
        subTask1.description == subTask2.description &&
        subTask1.deadLine == subTask2.deadLine &&
        subTask1.isCompleted == subTask2.isCompleted &&
        subTask1.totalTimeTaken == subTask2.totalTimeTaken &&
        subTask1.duration == subTask2.duration &&
        subTask1.id == subTask2.id;
  }

  bool _compareAssignedToDetailLists(
      List<AssignedToDetail>? list1, List<AssignedToDetail>? list2) {
    if (list1 == null && list2 == null) return true;
    if (list1 == null || list2 == null || list1.length != list2.length) {
      return false;
    }

    for (int i = 0; i < list1.length; i++) {
      if (!_compareAssignedToDetail(list1[i], list2[i])) {
        return false;
      }
    }
    return true;
  }

  bool _compareAssignedToDetail(
      AssignedToDetail? detail1, AssignedToDetail? detail2) {
    if (detail1 == null && detail2 == null) return true;
    if (detail1 == null || detail2 == null) return false;

    return detail1.localId == detail2.localId &&
        detail1.userId == detail2.userId &&
        detail1.name == detail2.name &&
        detail1.isAccepted == detail2.isAccepted;
  }

  bool _compareCreatedUserDetails(
      CreatedUserDetails? user1, CreatedUserDetails? user2) {
    if (user1 == null && user2 == null) return true;
    if (user1 == null || user2 == null) return false;

    return user1.id == user2.id &&
        user1.name == user2.name &&
        user1.profilePicture == user2.profilePicture;
  }

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
