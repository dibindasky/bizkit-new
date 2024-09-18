import 'package:json_annotation/json_annotation.dart';

part 'update_matcho_meter.g.dart';

@JsonSerializable()
class UpdateMatchoMeter {
  @JsonKey(name: 'question_id')
  String? questionId;
  List<String>? answers;

  UpdateMatchoMeter({this.questionId, this.answers});

  factory UpdateMatchoMeter.fromJson(Map<String, dynamic> json) {
    return _$UpdateMatchoMeterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateMatchoMeterToJson(this);
}
