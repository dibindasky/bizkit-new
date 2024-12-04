import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';

part 'macho_meter_model.g.dart';

@JsonSerializable()
class MachoMeterModel {
  @JsonKey(name: '_id')
  String? id;
  String? question;
  List<String>? answers;
  List<String>? userAnswer;
  bool showButton;

  MachoMeterModel({this.question, this.answers, this.id, this.userAnswer,this.showButton=false});

  factory MachoMeterModel.fromJson(Map<String, dynamic> json) {
    return _$MachoMeterModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    final json = _$MachoMeterModelToJson(this);

    // Remove null or empty fields
    json.removeWhere(
        (key, value) => value == null || (value is List && value.isEmpty));
    return json;
  }

  ///this json used for post and patch
  Map<String, dynamic> answerToJson() {
    var map = {
      '_id': id,
      'question': question,
      'answers': userAnswer,
    };
    map.removeWhere(
        (key, value) => value == null || (value is List && value.isEmpty));
    return map;
  }

  MachoMeterModel copyWith({
    String? id,
    List<String>? userAnswer,
    String? question,
    bool? showButton,
    List<String>? answers,
  }) {
    return MachoMeterModel(
      showButton: showButton??this.showButton,
      id: id ?? this.id,
      userAnswer: userAnswer ?? this.userAnswer,
      question: question ?? this.question,
      answers: answers ?? this.answers,
    );
  }
}
