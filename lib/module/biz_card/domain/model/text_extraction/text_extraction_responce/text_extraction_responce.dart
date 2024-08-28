import 'package:json_annotation/json_annotation.dart';

import 'extracted_details.dart';

part 'text_extraction_responce.g.dart';

@JsonSerializable()
class TextExtractionResponce {
  @JsonKey(name: 'extracted_details')
  ExtractedDetails? extractedDetails;

  TextExtractionResponce({this.extractedDetails});

  factory TextExtractionResponce.fromJson(Map<String, dynamic> json) {
    return _$TextExtractionResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TextExtractionResponceToJson(this);
}
