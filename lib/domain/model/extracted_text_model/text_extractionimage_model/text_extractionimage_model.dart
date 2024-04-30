import 'package:json_annotation/json_annotation.dart';

part 'text_extractionimage_model.g.dart';

@JsonSerializable()
class TextExtractionimageModel {
  List<String>? images;

  TextExtractionimageModel({this.images});

  factory TextExtractionimageModel.fromJson(Map<String, dynamic> json) {
    return _$TextExtractionimageModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TextExtractionimageModelToJson(this);
}
