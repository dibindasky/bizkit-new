import 'package:json_annotation/json_annotation.dart';

part 'tasks_counts_model.g.dart';

@JsonSerializable()
class EmpolyeesTasksCountsModel {
  @JsonKey(name: 'user_ids')
  List<String>? userIds;

  EmpolyeesTasksCountsModel({this.userIds});

  factory EmpolyeesTasksCountsModel.fromJson(Map<String, dynamic> json) {
    return _$EmpolyeesTasksCountsModelTasksCountsModelFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$EmpolyeesTasksCountsModelTasksCountsModelToJson(this);
}
