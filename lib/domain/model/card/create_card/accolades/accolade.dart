import 'package:json_annotation/json_annotation.dart';

part 'accolade.g.dart';

@JsonSerializable()
class Accolade {
  String? accolades;
  @JsonKey(name: 'accolades_image')
  dynamic accoladesImage;
  @JsonKey(name: 'accolades_description')
  String? accoladesDescription;

  Accolade({
    this.accolades,
    this.accoladesImage,
    this.accoladesDescription,
  });

  factory Accolade.fromJson(Map<String, dynamic> json) {
    return _$AccoladeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccoladeToJson(this);

  Accolade copyWith({
    String? accolades,
    dynamic accoladesImage,
    String? accoladesDescription,
  }) {
    return Accolade(
      accolades: accolades ?? this.accolades,
      accoladesImage: accoladesImage ?? this.accoladesImage,
      accoladesDescription: accoladesDescription ?? this.accoladesDescription,
    );
  }
}
