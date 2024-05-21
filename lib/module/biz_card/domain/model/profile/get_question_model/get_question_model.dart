import 'package:json_annotation/json_annotation.dart';

import 'questions.dart';

part 'get_question_model.g.dart';

@JsonSerializable()
class GetQuestionModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<Questions>? results;

  GetQuestionModel({this.count, this.next, this.previous, this.results});

  factory GetQuestionModel.fromJson(Map<String, dynamic> json) {
    return _$GetQuestionModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetQuestionModelToJson(this);
}
