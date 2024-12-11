import 'package:json_annotation/json_annotation.dart';

part 'personal_details_request_model.g.dart';

@JsonSerializable()
class PersonalDetailsRequestModel {
  String? name;
  String? email;
  List<String>? phone;
  String? address;
  String? dob;
  @JsonKey(name: 'blood_group')
  String? bloodGroup;
  List<String>? images;
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'personal_details_id')
  String? personalDetailsId;
  @JsonKey(name: 'personal_story')
  String? personalStory;
  @JsonKey(name: 'want_to_show_personal_story')
  bool? showPersonalStory;

  PersonalDetailsRequestModel({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.dob,
    this.bloodGroup,
    this.images,
    this.bizcardId,
    this.personalDetailsId,
    this.personalStory,
    this.showPersonalStory = false,
  });

  factory PersonalDetailsRequestModel.fromJson(Map<String, dynamic> json) {
    return _$PersonalDetailsRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    // return _$PersonalDetailsRequestModelToJson(this);
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      // dont send data in dob field if dob is empty
      'dob': (dob?.isNotEmpty ?? false) ? dob : null,
      'blood_group': bloodGroup,
      'images': images,
      'bizcard_id': bizcardId,
      'personal_details_id': personalDetailsId,
      'personal_story': personalStory,
      'want_to_show_personal_story': showPersonalStory,
    };
  }
}
