import 'package:json_annotation/json_annotation.dart';

part 'matcho_meter_model.g.dart';

@JsonSerializable()
class MatchoMeterModel {
  String? question;
  List<String>? answers;

  MatchoMeterModel({this.question, this.answers});

  factory MatchoMeterModel.fromJson(Map<String, dynamic> json) {
    return _$MatchoMeterModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MatchoMeterModelToJson(this);
}
