import 'package:json_annotation/json_annotation.dart';

part 'dates_to_remember.g.dart';

@JsonSerializable()
class DatesToRememberCreate {
  String? date;
  String? label;

  DatesToRememberCreate({this.date, this.label});

  factory DatesToRememberCreate.fromJson(Map<String, dynamic> json) {
    return _$DatesToRememberCreateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DatesToRememberCreateToJson(this);

  DatesToRememberCreate copyWith({
    String? date,
    String? label,
  }) {
    return DatesToRememberCreate(
      date: date ?? this.date,
      label: label ?? this.label,
    );
  }
}
