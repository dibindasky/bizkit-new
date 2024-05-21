import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
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

  Profile({
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

  factory Profile.fromJson(Map<String, dynamic> json) {
    return _$ProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
