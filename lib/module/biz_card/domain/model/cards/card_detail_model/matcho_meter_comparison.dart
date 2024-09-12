import 'package:json_annotation/json_annotation.dart';

part 'matcho_meter_comparison.g.dart';

@JsonSerializable()
class MatchoMeterComparison {
  String? question;
  @JsonKey(name: 'common_answers')
  List<String>? commonAnswers;

  MatchoMeterComparison({this.question, this.commonAnswers});

  factory MatchoMeterComparison.fromJson(Map<String, dynamic> json) {
    return _$MatchoMeterComparisonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MatchoMeterComparisonToJson(this);
}
