import 'package:json_annotation/json_annotation.dart';

part 'accredition.g.dart';

@JsonSerializable()
class AccreditionCreate {
  dynamic image;
  String? label;
  String? description;

  AccreditionCreate({this.image, this.label, this.description});

  factory AccreditionCreate.fromJson(Map<String, dynamic> json) {
    return _$AccreditionCreateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccreditionCreateToJson(this);

  AccreditionCreate copyWith({
    dynamic image,
    String? label,
    String? description,
  }) {
    return AccreditionCreate(
      image: image ?? this.image,
      label: label ?? this.label,
      description: description ?? this.description,
    );
  }
}
