import 'package:json_annotation/json_annotation.dart';

import 'dates_to_remember.dart';
import 'achievement.dart';
import 'personal_social_media.dart';

part 'personal_details.g.dart';

@JsonSerializable()
class PersonalDetails {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? email;
  List<String>? phone;
  String? address;
  @JsonKey(name: 'blood_group')
  String? bloodGroup;
  String? dob;
  List<String>? images;
  @JsonKey(name: 'personal_achievements')
  List<Achievement>? personalAchievements;
  @JsonKey(name: 'personal_social_media')
  List<PersonalSocialMedia>? personalSocialMedia;
  @JsonKey(name: 'dates_to_remember')
  List<DatesToRemember>? datesToRemember;

  PersonalDetails({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.bloodGroup,
    this.dob,
    this.images,
    this.personalAchievements,
    this.personalSocialMedia,
    this.datesToRemember,
  });

  factory PersonalDetails.fromJson(Map<String, dynamic> json) {
    return _$PersonalDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalDetailsToJson(this);
}
