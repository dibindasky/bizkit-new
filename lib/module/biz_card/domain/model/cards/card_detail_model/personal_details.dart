import 'package:json_annotation/json_annotation.dart';

import 'dates_to_remember.dart';
import 'achievement.dart';
import 'social_media_handle.dart';

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
  @JsonKey(name: 'personal_story')
  String? personalStory;
  @JsonKey(name: 'want_to_show_personal_story')
  bool? showPersonalStory;
  @JsonKey(name: 'personal_achievements')
  List<Achievement>? personalAchievements;
  @JsonKey(name: 'personal_social_media')
  List<SocialMediaHandles>? personalSocialMedia;
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
    this.personalStory,
    this.showPersonalStory,
  });

  PersonalDetails copyWith({
    String? id,
    String? name,
    String? email,
    List<String>? phone,
    String? address,
    String? bloodGroup,
    String? dob,
    String? personalStory,
    bool? showPersonalStory,
    List<String>? images,
    List<Achievement>? personalAchievements,
    List<SocialMediaHandles>? personalSocialMedia,
    List<DatesToRemember>? datesToRemember,
  }) {
    return PersonalDetails(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      dob: dob ?? this.dob,
      images: images ?? this.images,
      personalAchievements: personalAchievements ?? this.personalAchievements,
      personalSocialMedia: personalSocialMedia ?? this.personalSocialMedia,
      datesToRemember: datesToRemember ?? this.datesToRemember,
      personalStory: personalStory?? this.personalStory,
      showPersonalStory: showPersonalStory?? this.showPersonalStory,
    );
  }

  factory PersonalDetails.fromJson(Map<String, dynamic> json) {
    return _$PersonalDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalDetailsToJson(this);
}
