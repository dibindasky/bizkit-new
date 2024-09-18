import 'package:json_annotation/json_annotation.dart';

part 'matcho_meter.g.dart';

@JsonSerializable()
class MatchoMeter {
  @JsonKey(name: '_id')
  String? id;
  String? question;
  List<String>? answers;

  MatchoMeter({this.id, this.question, this.answers});

  factory MatchoMeter.fromJson(Map<String, dynamic> json) {
    return _$MatchoMeterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MatchoMeterToJson(this);
}
