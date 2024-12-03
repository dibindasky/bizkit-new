import 'package:json_annotation/json_annotation.dart';

import 'assigned_to.dart';
import 'completed_by.dart';
import 'created_by.dart';

part 'quick_tasks.g.dart';

@JsonSerializable()
class QuickTasks {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  String? description;
  @JsonKey(name: 'assigned_to')
  List<AssignedTo>? assignedTo;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;
  @JsonKey(name: 'created_by')
  CreatedBy? createdBy;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'completed_by')
  List<CompletedBy>? completedBy;
  @JsonKey(name: 'completed_at')
  String? completedAt;
  @JsonKey(name: 'is_owned')
  bool? isOwned;

  QuickTasks({
    this.id,
    this.title,
    this.description,
    this.assignedTo,
    this.isCompleted,
    this.createdBy,
    this.createdAt,
    this.completedBy,
    this.completedAt,
    this.isOwned,
  });

  factory QuickTasks.fromJson(Map<String, dynamic> json) =>
      _$QuickTasksFromJson(json);

  Map<String, dynamic> toJson() => _$QuickTasksToJson(this);
  QuickTasks copyWith({
    String? id,
    String? title,
    String? description,
    List<AssignedTo>? assignedTo,
    bool? isCompleted,
    CreatedBy? createdBy,
    String? createdAt,
    List<CompletedBy>? completedBy,
    String? completedAt,
    bool? isOwned,
  }) {
    return QuickTasks(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      assignedTo: assignedTo ?? this.assignedTo,
      isCompleted: isCompleted ?? this.isCompleted,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      completedBy: completedBy ?? this.completedBy,
      completedAt: completedAt ?? this.completedAt,
      isOwned: isOwned ?? this.isOwned,
    );
  }
}
