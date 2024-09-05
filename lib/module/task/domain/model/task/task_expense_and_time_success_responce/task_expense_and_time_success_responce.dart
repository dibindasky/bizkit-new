import 'package:json_annotation/json_annotation.dart';

import 'detail.dart';

part 'task_expense_and_time_success_responce.g.dart';

@JsonSerializable()
class TaskExpenseAndTimeSuccessResponce {
  @JsonKey(name: 'total_time')
  int? totalTime;
  @JsonKey(name: 'total_expense')
  int? totalExpense;
  String? name;
  @JsonKey(name: 'profile_picture')
  String? profilePicture;
  List<Detail>? details;

  TaskExpenseAndTimeSuccessResponce({
    this.totalTime,
    this.totalExpense,
    this.name,
    this.profilePicture,
    this.details,
  });

  factory TaskExpenseAndTimeSuccessResponce.fromJson(
      Map<String, dynamic> json) {
    return _$TaskExpenseAndTimeSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TaskExpenseAndTimeSuccessResponceToJson(this);
  }
}
