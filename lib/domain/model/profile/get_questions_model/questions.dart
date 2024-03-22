import 'package:json_annotation/json_annotation.dart';

part 'questions.g.dart';

@JsonSerializable()
class Questions {
  int? id;
  String? question;
  String? answer;

  Questions({this.id, this.question, this.answer});

  factory Questions.fromJson(Map<String, dynamic> json) {
    return _$QuestionsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QuestionsToJson(this);
}
