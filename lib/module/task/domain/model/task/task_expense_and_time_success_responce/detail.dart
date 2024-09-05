import 'package:json_annotation/json_annotation.dart';

part 'detail.g.dart';

@JsonSerializable()
class Detail {
  int? time;
  int? expense;
  String? description;

  Detail({this.time, this.expense, this.description});

  factory Detail.fromJson(Map<String, dynamic> json) {
    return _$DetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailToJson(this);
}
