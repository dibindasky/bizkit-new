import 'package:json_annotation/json_annotation.dart';

part 'next_action_date.g.dart';

@JsonSerializable()
class NextActionDate {
  String? date;
  String? description;
  @JsonKey(name: 'by_whom')
  String? byWhom;
  NextActionDate({this.date, this.description, this.byWhom});

  factory NextActionDate.fromJson(Map<String, dynamic> json) {
    return _$NextActionDateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NextActionDateToJson(this);
}
