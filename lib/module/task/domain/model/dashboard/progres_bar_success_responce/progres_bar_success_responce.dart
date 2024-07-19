import 'package:json_annotation/json_annotation.dart';

import 'counts.dart';

part 'progres_bar_success_responce.g.dart';

@JsonSerializable()
class ProgresBarSuccessResponce {
  Counts? counts;

  ProgresBarSuccessResponce({this.counts});

  factory ProgresBarSuccessResponce.fromJson(Map<String, dynamic> json) {
    return _$ProgresBarSuccessResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProgresBarSuccessResponceToJson(this);
}
