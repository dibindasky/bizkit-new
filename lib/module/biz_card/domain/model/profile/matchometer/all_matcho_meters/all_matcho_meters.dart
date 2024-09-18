import 'package:json_annotation/json_annotation.dart';

import 'matcho_meter.dart';

part 'all_matcho_meters.g.dart';

@JsonSerializable()
class AllMatchoMeters {
  @JsonKey(name: 'matcho_meter')
  List<MatchoMeter>? matchoMeter;

  AllMatchoMeters({this.matchoMeter});

  factory AllMatchoMeters.fromJson(Map<String, dynamic> json) {
    return _$AllMatchoMetersFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllMatchoMetersToJson(this);
}
