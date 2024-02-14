import 'package:json_annotation/json_annotation.dart';

part 'brochure.g.dart';

@JsonSerializable()
class BrochureCreate {
  dynamic file;

  BrochureCreate({this.file});

  factory BrochureCreate.fromJson(Map<String, dynamic> json) {
    return _$BrochureCreateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BrochureCreateToJson(this);

  BrochureCreate copyWith({
    dynamic file,
  }) {
    return BrochureCreate(
      file: file ?? this.file,
    );
  }
}
