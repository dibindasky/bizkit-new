import 'package:json_annotation/json_annotation.dart';

part 'brochure.g.dart';

@JsonSerializable()
class Brochure {
  dynamic file;

  Brochure({this.file});

  factory Brochure.fromJson(Map<String, dynamic> json) {
    return _$BrochureFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BrochureToJson(this);

  Brochure copyWith({
    dynamic file,
  }) {
    return Brochure(
      file: file ?? this.file,
    );
  }
}
