import 'package:bizkit/domain/model/card/create_card/accolades/accolade.dart';
import 'package:bizkit/domain/model/card/create_card/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/domain/model/card/create_card/social_media_handle/social_media_handle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'personal_details.g.dart';

@JsonSerializable()
class PersonalDetailsCreate {
  @JsonKey(name: 'accolades_id')
  List<AccoladeCreate>? accolades;
  @JsonKey(name: 'personal_social_media_id')
  List<SocialMediaHandleCreate>? personalSocialMedia;
  @JsonKey(name: 'dates_to_remember_id')
  List<DatesToRememberCreate>? datesToRemember;
  String? photos;
  String? name;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? email;
  String? designation;
  @JsonKey(name: 'business_category_id')
  int? businessCategory;
  @JsonKey(name: 'home_address')
  String? homeAddress;
  @JsonKey(name: 'blood_group')
  String? bloodGroup;
  @JsonKey(name: 'date_of_birth')
  String? dateOfBirth;

  PersonalDetailsCreate({
    this.accolades,
    this.personalSocialMedia,
    this.datesToRemember,
    this.photos,
    this.name,
    this.phoneNumber,
    this.email,
    this.designation,
    this.businessCategory,
    this.homeAddress,
    this.bloodGroup,
    this.dateOfBirth,
  });

  factory PersonalDetailsCreate.fromJson(Map<String, dynamic> json) {
    return _$PersonalDetailsCreateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalDetailsCreateToJson(this);

  PersonalDetailsCreate copyWith({
    List<AccoladeCreate>? accolades,
    List<SocialMediaHandleCreate>? personalSocialMedia,
    List<DatesToRememberCreate>? datesToRemember,
    String? photos,
    String? name,
    String? phoneNumber,
    String? email,
    int? businessCategory,
    String? homeAddress,
    String? bloodGroup,
    String? designation,
    String? dateOfBirth,
  }) {
    return PersonalDetailsCreate(
      accolades: accolades ?? this.accolades,
      personalSocialMedia: personalSocialMedia ?? this.personalSocialMedia,
      datesToRemember: datesToRemember ?? this.datesToRemember,
      photos: photos ?? this.photos,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      designation: designation ?? this.designation,
      businessCategory: businessCategory ?? this.businessCategory,
      homeAddress: homeAddress ?? this.homeAddress,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }
}
