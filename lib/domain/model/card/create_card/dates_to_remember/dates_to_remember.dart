import 'package:json_annotation/json_annotation.dart';

part 'dates_to_remember.g.dart';

@JsonSerializable()
class DatesToRemember {
  String? date;
  String? label;

  DatesToRemember({this.date, this.label});

  factory DatesToRemember.fromJson(Map<String, dynamic> json) {
    return _$DatesToRememberFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DatesToRememberToJson(this);

  DatesToRemember copyWith({
    String? date,
    String? label,
  }) {
    return DatesToRemember(
      date: date ?? this.date,
      label: label ?? this.label,
    );
  }
}
