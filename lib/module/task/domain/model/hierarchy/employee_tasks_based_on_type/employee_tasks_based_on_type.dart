import 'package:json_annotation/json_annotation.dart';

part 'employee_tasks_based_on_type.g.dart';

@JsonSerializable()
class EmployeeTasksBasedOnType {
  @JsonKey(name: 'target_user_id')
  String? targetUserId;
  @JsonKey(name: 'task_type')
  String? taskType;
  int? page;
  @JsonKey(name: 'page_size')
  int? pageSize;

  EmployeeTasksBasedOnType({
    this.targetUserId,
    this.taskType,
    this.page,
    this.pageSize,
  });

  factory EmployeeTasksBasedOnType.fromJson(Map<String, dynamic> json) {
    return _$EmployeeTasksBasedOnTypeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmployeeTasksBasedOnTypeToJson(this);
}
