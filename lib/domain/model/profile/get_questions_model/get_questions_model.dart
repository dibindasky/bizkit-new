import 'package:json_annotation/json_annotation.dart';

import 'questions.dart';

part 'get_questions_model.g.dart';

@JsonSerializable()
class GetQuestionsModel {
  List<Questions>? results;

  GetQuestionsModel({this.results});

  factory GetQuestionsModel.fromJson(Map<String, dynamic> json) {
    return _$GetQuestionsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetQuestionsModelToJson(this);
}
