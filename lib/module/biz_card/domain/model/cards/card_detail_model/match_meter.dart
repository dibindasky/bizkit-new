import 'package:json_annotation/json_annotation.dart';

import 'matcho_meter_comparison.dart';

part 'match_meter.g.dart';

@JsonSerializable()
class MatchMeter {
  @JsonKey(name: 'matcho_meter_comparison')
  List<MatchoMeterComparison>? matchoMeterComparison;

  MatchMeter({this.matchoMeterComparison});

  factory MatchMeter.fromJson(Map<String, dynamic> json) {
    return _$MatchMeterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MatchMeterToJson(this);
}
