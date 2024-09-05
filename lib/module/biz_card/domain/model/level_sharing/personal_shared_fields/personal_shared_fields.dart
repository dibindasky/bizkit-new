import 'package:json_annotation/json_annotation.dart';

part 'personal_shared_fields.g.dart';

@JsonSerializable()
class PersonalSharedFields {
  bool? name;
  bool? email;
  bool? phone;
  @JsonKey(name: 'personal_achievements')
  bool? personalAchievements;
  @JsonKey(name: 'personal_social_media')
  bool? personalSocialMedia;
  bool? dob;
  @JsonKey(name: 'blood_group')
  bool? bloodGroup;

  PersonalSharedFields({
    this.name,
    this.email,
    this.phone,
    this.personalAchievements,
    this.personalSocialMedia,
    this.dob,
    this.bloodGroup,
  });

  factory PersonalSharedFields.fromJson(Map<String, dynamic> json) {
    return _$PersonalSharedFieldsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalSharedFieldsToJson(this);
  PersonalSharedFields copyWith({
    bool? name,
    bool? email,
    bool? phone,
    bool? personalAchievements,
    bool? personalSocialMedia,
    bool? dob,
    bool? bloodGroup,
  }) {
    return PersonalSharedFields(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      personalAchievements: personalAchievements ?? this.personalAchievements,
      personalSocialMedia: personalSocialMedia ?? this.personalSocialMedia,
      dob: dob ?? this.dob,
      bloodGroup: bloodGroup ?? this.bloodGroup,
    );
  }
}
