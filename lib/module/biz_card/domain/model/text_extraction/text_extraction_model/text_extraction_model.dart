import 'package:json_annotation/json_annotation.dart';

part 'text_extraction_model.g.dart';

@JsonSerializable()
class TextExtractionModel {
  String? image;

  TextExtractionModel({this.image});

  factory TextExtractionModel.fromJson(Map<String, dynamic> json) {
    return _$TextExtractionModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TextExtractionModelToJson(this);
}
