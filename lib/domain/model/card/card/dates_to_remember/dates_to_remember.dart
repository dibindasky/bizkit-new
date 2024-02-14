import 'package:json_annotation/json_annotation.dart';

part 'dates_to_remember.g.dart';

@JsonSerializable()
class DatesToRemember {
  int? id;
  String? date;
  String? label;

  DatesToRemember({this.id, this.date, this.label});

  factory DatesToRemember.fromJson(Map<String, dynamic> json) {
    return _$DatesToRememberFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DatesToRememberToJson(this);
}
