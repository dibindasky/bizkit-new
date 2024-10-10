import 'package:json_annotation/json_annotation.dart';

part 'create_quick_task_responce.g.dart';

@JsonSerializable()
class CreateQuickTaskResponce {
  String? message;
  @JsonKey(name: 'quick_task_id')
  String? quickTaskId;

  CreateQuickTaskResponce({this.message, this.quickTaskId});

  factory CreateQuickTaskResponce.fromJson(Map<String, dynamic> json) {
    return _$CreateQuickTaskResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateQuickTaskResponceToJson(this);
}
