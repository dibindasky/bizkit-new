import 'package:bizkit/domain/model/card/accolades/accolade.dart';
import 'package:bizkit/domain/model/card/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/domain/model/card/social_media_handle/social_media_handle.dart';
import 'package:json_annotation/json_annotation.dart';

import 'photo.dart';

part 'personal_details.g.dart';

@JsonSerializable()
class PersonalDetails {
  List<Accolade>? accolades;
  @JsonKey(name: 'personal_social_media')
  List<SocialMediaHandle>? personalSocialMedia;
  @JsonKey(name: 'dates_to_remember')
  List<DatesToRemember>? datesToRemember;
  List<Photo>? photos;
  String? name;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? email;
  String? company;
  @JsonKey(name: 'business_category')
  String? businessCategory;
  @JsonKey(name: 'home_address')
  String? homeAddress;
  @JsonKey(name: 'blood_group')
  String? bloodGroup;
  @JsonKey(name: 'date_of_birth')
  String? dateOfBirth;

  PersonalDetails({
    this.accolades,
    this.personalSocialMedia,
    this.datesToRemember,
    this.photos,
    this.name,
    this.phoneNumber,
    this.email,
    this.company,
    this.businessCategory,
    this.homeAddress,
    this.bloodGroup,
    this.dateOfBirth,
  });

  factory PersonalDetails.fromJson(Map<String, dynamic> json) {
    return _$PersonalDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalDetailsToJson(this);
}
