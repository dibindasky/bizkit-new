import 'package:json_annotation/json_annotation.dart';

part 'detail.g.dart';

@JsonSerializable()
class Detail {
  int? time;
  int? expense;
  String? description;
  @JsonKey(name: 'updated_time')
  String? updatedTime;

  Detail({this.time, this.expense, this.description, this.updatedTime});

  factory Detail.fromJson(Map<String, dynamic> json) {
    return _$DetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailToJson(this);
}
