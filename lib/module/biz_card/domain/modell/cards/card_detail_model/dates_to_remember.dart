import 'package:json_annotation/json_annotation.dart';

part 'dates_to_remember.g.dart';

@JsonSerializable()
class DatesToRemember {
  String? date;
  String? description;
  @JsonKey(name: '_id')
  String? id;

  DatesToRemember({this.date, this.description, this.id});

  factory DatesToRemember.fromJson(Map<String, dynamic> json) {
    return _$DatesToRememberFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DatesToRememberToJson(this);
}
