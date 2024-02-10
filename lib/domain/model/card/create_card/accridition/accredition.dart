import 'package:json_annotation/json_annotation.dart';

part 'accredition.g.dart';

@JsonSerializable()
class Accredition {
  dynamic image;
  String? label;
  String? description;

  Accredition({this.image, this.label, this.description});

  factory Accredition.fromJson(Map<String, dynamic> json) {
    return _$AccreditionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccreditionToJson(this);

  Accredition copyWith({
    dynamic image,
    String? label,
    String? description,
  }) {
    return Accredition(
      image: image ?? this.image,
      label: label ?? this.label,
      description: description ?? this.description,
    );
  }
}
