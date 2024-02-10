import 'package:bizkit/domain/model/card/create_card/accolades/accolade.dart';
import 'package:bizkit/domain/model/card/create_card/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/domain/model/card/create_card/photo/photo.dart';
import 'package:bizkit/domain/model/card/create_card/social_media_handle/social_media_handle.dart';
import 'package:json_annotation/json_annotation.dart';

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

  PersonalDetails copyWith({
    List<Accolade>? accolades,
    List<SocialMediaHandle>? personalSocialMedia,
    List<DatesToRemember>? datesToRemember,
    List<Photo>? photos,
    String? name,
    String? phoneNumber,
    String? email,
    String? company,
    String? businessCategory,
    String? homeAddress,
    String? bloodGroup,
    String? dateOfBirth,
  }) {
    return PersonalDetails(
      accolades: accolades ?? this.accolades,
      personalSocialMedia: personalSocialMedia ?? this.personalSocialMedia,
      datesToRemember: datesToRemember ?? this.datesToRemember,
      photos: photos ?? this.photos,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      company: company ?? this.company,
      businessCategory: businessCategory ?? this.businessCategory,
      homeAddress: homeAddress ?? this.homeAddress,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }
}
