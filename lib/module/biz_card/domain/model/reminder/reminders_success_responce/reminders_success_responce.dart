import 'package:json_annotation/json_annotation.dart';

import 'reminder.dart';

part 'reminders_success_responce.g.dart';

@JsonSerializable()
class RemindersSuccessResponce {
  @JsonKey(name: 'data')
  List<Reminder>? reminders;
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'page_size')
  int? pageSize;
  @JsonKey(name: 'has_more')
  bool? hasMore;

  RemindersSuccessResponce(
      {this.reminders, this.hasMore, this.page, this.pageSize});

  factory RemindersSuccessResponce.fromJson(Map<String, dynamic> json) {
    return _$RemindersSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RemindersSuccessResponceToJson(this);
}
