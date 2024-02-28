import 'package:json_annotation/json_annotation.dart';

part 'brochure.g.dart';

@JsonSerializable()
class BrochureCreate {
  dynamic file;
  String? label;
  String? image;

  BrochureCreate({this.file, this.label, this.image = ""});

  factory BrochureCreate.fromJson(Map<String, dynamic> json) {
    return _$BrochureCreateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BrochureCreateToJson(this);

  BrochureCreate copyWith({dynamic file, String? label, String? image}) {
    return BrochureCreate(
      file: file ?? this.file,
      label: label ?? this.label,
      image: image ?? this.image,
    );
  }
}
