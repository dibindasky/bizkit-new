import 'package:json_annotation/json_annotation.dart';

part 'brochure.g.dart';

@JsonSerializable()
class Brochure {
  int? id;
  String? file;
  String? image;
  String? label;

  Brochure({this.id, this.file, this.image, this.label});

  factory Brochure.fromJson(Map<String, dynamic> json) {
    return _$BrochureFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BrochureToJson(this);
}
