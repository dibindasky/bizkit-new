import 'package:json_annotation/json_annotation.dart';

part 'tasks_counts_model.g.dart';

@JsonSerializable()
class EmpolyeesTasksCountsModel {
  @JsonKey(name: 'user_ids')
  List<String>? userIds;

  EmpolyeesTasksCountsModel({this.userIds});

  factory EmpolyeesTasksCountsModel.fromJson(Map<String, dynamic> json) {
    return _$EmpolyeesTasksCountsModelFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$EmpolyeesTasksCountsModelToJson(this);
}
