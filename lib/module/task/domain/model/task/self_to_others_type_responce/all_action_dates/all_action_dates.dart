import 'package:json_annotation/json_annotation.dart';

part 'all_action_dates.g.dart';

@JsonSerializable()
class AllActionDates {
  String? date;
  String? description;
  @JsonKey(name: 'by_whom')
  String? byWhom;

  AllActionDates({this.date, this.description, this.byWhom});

  factory AllActionDates.fromJson(Map<String, dynamic> json) {
    return _$AllActionDatesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllActionDatesToJson(this);
}
