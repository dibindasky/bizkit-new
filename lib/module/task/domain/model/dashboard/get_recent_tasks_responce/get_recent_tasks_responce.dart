import 'package:bizkit/module/task/domain/model/dashboard/get_recent_tasks_responce/recent_tasks/recent_tasks.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_recent_tasks_responce.g.dart';

@JsonSerializable()
class GetRecentTasksResponce {
  @JsonKey(name: 'self_to_self')
  List<RecentTasks>? selfToSelf;
  @JsonKey(name: 'self_to_others')
  List<RecentTasks>? selfToOthers;
  @JsonKey(name: 'others_to_self')
  List<RecentTasks>? othersToSelf;

  GetRecentTasksResponce({
    this.selfToSelf,
    this.selfToOthers,
    this.othersToSelf,
  });

  factory GetRecentTasksResponce.fromJson(Map<String, dynamic> json) {
    return _$GetRecentTasksResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetRecentTasksResponceToJson(this);
}
