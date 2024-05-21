import 'package:json_annotation/json_annotation.dart';

part 'extracted_text_model.g.dart';

@JsonSerializable()
class ExtractedTextModel {
  List<String>? names;
  List<String>? emails;
  @JsonKey(name: 'phone_numbers')
  List<String>? phoneNumbers;
  List<String>? websites;
  List<String>? designations;

  ExtractedTextModel(
      {this.names,
      this.emails,
      this.phoneNumbers,
      this.websites,
      this.designations});

  factory ExtractedTextModel.fromJson(Map<String, dynamic> json) {
    return _$ExtractedTextModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExtractedTextModelToJson(this);
}
