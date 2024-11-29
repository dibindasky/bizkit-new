import 'package:json_annotation/json_annotation.dart';

part 'reminder_query_params_model.g.dart';

@JsonSerializable()
class ReminderQueryParamsModel {
  @JsonKey(name: 'category')
  String? category;
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'page_size')
  int? pageSize;

  ReminderQueryParamsModel({this.category, this.page, this.pageSize});

  factory ReminderQueryParamsModel.fromJson(Map<String, dynamic> json) {
    return _$ReminderQueryParamsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReminderQueryParamsModelToJson(this);
}
