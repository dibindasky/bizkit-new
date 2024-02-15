import 'package:json_annotation/json_annotation.dart';

part 'brochure.g.dart';

@JsonSerializable()
class Brochure {
  int? id;
  String? file;

  Brochure({this.id, this.file});

  factory Brochure.fromJson(Map<String, dynamic> json) {
    return _$BrochureFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BrochureToJson(this);
}
