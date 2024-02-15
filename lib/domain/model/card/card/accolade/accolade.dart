import 'package:json_annotation/json_annotation.dart';

part 'accolade.g.dart';

@JsonSerializable()
class Accolade {
  int? id;
  @JsonKey(name: 'accolades_image')
  String? accoladesImage;
  String? accolades;
  @JsonKey(name: 'accolades_description')
  String? accoladesDescription;

  Accolade({
    this.id,
    this.accoladesImage,
    this.accolades,
    this.accoladesDescription,
  });

  factory Accolade.fromJson(Map<String, dynamic> json) {
    return _$AccoladeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccoladeToJson(this);
}
