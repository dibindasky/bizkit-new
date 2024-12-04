import 'package:bizkit/module/task/domain/model/folders/edit_task_responce/next_action_date.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/created_user_details.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/recent_visit_log.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/visit_log.dart';
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
  @JsonKey(name: 'recent_visit_logs')
  List<RecentVisitLog>? recentVisitLogs;
  @JsonKey(name: 'next_action_date')
  List<NextActionDate>? nextActionDate;
  @JsonKey(name: 'visit_logs')
  List<VisitLog>? visitLogs;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'updated_field')
  String? updatedField;

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
    this.recentVisitLogs,
    this.visitLogs,
    this.nextActionDate,
    this.updatedAt,
    this.updatedField,

    // this.isPinned,
    // this.localId,
    // this.spotlightOn,
    // this.taskType,
  });

  factory GetTaskResponce.fromJson(Map<String, dynamic> json) {
    return _$GetTaskResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetTaskResponceToJson(this);
  GetTaskResponce copyWith(
      {
      // int? localId,
      // String? taskType,
      // bool? spotlightOn,
      // bool? isPinned,
      String? id,
      String? createdBy,
      String? title,
      String? description,
      String? priorityLevel,
      bool? recurrentTask,
      bool? isCompleted,
      bool? isOwned,
      String? deadLine,
      bool? isKilled,
      List<String>? tags,
      List<Attachment>? attachments,
      List<SubTask>? subTask,
      String? createdAt,
      String? status,
      CreatedUserDetails? createdUserDetails,
      List<AssignedToDetail>? assignedToDetails,
      int? totalTime,
      int? totalExpense,
      List<RecentVisitLog>? recentVisitLogs,
      List<NextActionDate>? nextActionDate,
      List<VisitLog>? visitLogs,
      String? updatedAt,
      String? updatedField}) {
    return GetTaskResponce(
      // localId: localId ?? this.localId,
      // taskType: taskType ?? this.taskType,
      // spotlightOn: spotlightOn ?? this.spotlightOn,
      // isPinned: isPinned ?? this.isPinned,
      id: id ?? this.id,
      createdBy: createdBy ?? this.createdBy,
      title: title ?? this.title,
      description: description ?? this.description,
      priorityLevel: priorityLevel ?? this.priorityLevel,
      recurrentTask: recurrentTask ?? this.recurrentTask,
      isCompleted: isCompleted ?? this.isCompleted,
      isOwned: isOwned ?? this.isOwned,
      deadLine: deadLine ?? this.deadLine,
      isKilled: isKilled ?? this.isKilled,
      tags: tags ?? this.tags,
      attachments: attachments ?? this.attachments,
      subTask: subTask ?? this.subTask,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      createdUserDetails: createdUserDetails ?? this.createdUserDetails,
      assignedToDetails: assignedToDetails ?? this.assignedToDetails,
      totalTime: totalTime ?? this.totalTime,
      totalExpense: totalExpense ?? this.totalExpense,
      recentVisitLogs: recentVisitLogs ?? this.recentVisitLogs,
      nextActionDate: nextActionDate ?? this.nextActionDate,
      visitLogs: visitLogs ?? this.visitLogs,
      updatedAt: updatedAt ?? this.updatedAt,
      updatedField: updatedField ?? this.updatedField,
    );
  }

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

    final map1 = {
      for (var attachmetList1 in list1)
        attachmetList1.attachment: attachmetList1
    };
    final map2 = {
      for (var attachmetList1 in list2)
        attachmetList1.attachment: attachmetList1
    };
    if (map1.length != map2.length) return false;
    for (var key in map1.keys) {
      if (!map2.containsKey(key)) return false;
      if (!map2[key]!.equals(map1[key]!)) return false;
    }
    return true;
  }

  bool _compareSubTaskLists(List<SubTask>? list1, List<SubTask>? list2) {
    if (list1 == null && list2 == null) return true;
    if (list1 == null || list2 == null || list1.length != list2.length) {
      return false;
    }

    final map1 = {
      for (var subTaskListItem in list1) subTaskListItem.id: subTaskListItem
    };
    final map2 = {
      for (var subTaskListItem in list2) subTaskListItem.id: subTaskListItem
    };
    if (map1.length != map2.length) return false;
    for (var key in map1.keys) {
      if (!map2.containsKey(key)) return false;
      if (!map2[key]!.equals(map1[key]!)) return false;
    }
    return true;
  }

  bool _compareAssignedToDetailLists(
      List<AssignedToDetail>? list1, List<AssignedToDetail>? list2) {
    if (list1 == null && list2 == null) return true;
    if (list1 == null || list2 == null || list1.length != list2.length) {
      return false;
    }

    final map1 = {
      for (var assignedToDetailsItem in list1)
        assignedToDetailsItem.userId: assignedToDetailsItem
    };
    final map2 = {
      for (var assignedToDetailsItem in list2)
        assignedToDetailsItem.userId: assignedToDetailsItem
    };
    if (map1.length != map2.length) return false;
    for (var key in map1.keys) {
      if (!map2.containsKey(key)) return false;
      if (!map2[key]!.equals(map1[key]!)) return false;
    }
    return true;
  }

  bool _compareCreatedUserDetails(
      CreatedUserDetails? user1, CreatedUserDetails? user2) {
    if (user1 == null && user2 == null) return true;
    if (user1 == null || user2 == null) return false;

    return user1.equals(user2);
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
