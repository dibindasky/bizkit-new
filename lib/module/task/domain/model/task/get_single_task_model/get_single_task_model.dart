import 'package:json_annotation/json_annotation.dart';

part 'get_single_task_model.g.dart';

@JsonSerializable()
class GetSingleTaskModel {
  @JsonKey(name: 'task_id')
  String? taskId;

  GetSingleTaskModel({this.taskId});

  factory GetSingleTaskModel.fromJson(Map<String, dynamic> json) {
    return _$GetSingleTaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetSingleTaskModelToJson(this);
}
