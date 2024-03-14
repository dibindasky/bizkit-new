import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  int? id;
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'profile_pic')
  String? profilePic;
  String? name;
  String? company;
  @JsonKey(name: 'website_link')
  String? websiteLink;
  String? address;
  @JsonKey(name: 'is_business')
  bool? isBusiness;

  Result({
    this.id,
    this.email,
    this.phoneNumber,
    this.profilePic,
    this.name,
    this.company,
    this.websiteLink,
    this.address,
    this.isBusiness,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
