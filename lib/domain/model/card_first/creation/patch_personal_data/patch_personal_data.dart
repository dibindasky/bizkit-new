import 'package:bizkit/domain/model/card_first/creation/card_first_creation_model/personal_photo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patch_personal_data.g.dart';

@JsonSerializable()
class PatchPersonalData {
  String? name;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? email;
  String? designation;
  @JsonKey(name: 'date_of_birth')
  String? dateOfBirth;
  @JsonKey(name: 'blood_group')
  String? bloodGroup;
  @JsonKey(name: 'home_address')
  String? homeAddress;
  List<PersonalPhoto>? photos;
  @JsonKey(name: 'business_category_id')
  int? businessCategoryId;

  PatchPersonalData({
    this.name,
    this.phoneNumber,
    this.email,
    this.designation,
    this.dateOfBirth,
    this.bloodGroup,
    this.homeAddress,
    this.photos,
    this.businessCategoryId,
  });

  factory PatchPersonalData.fromJson(Map<String, dynamic> json) {
    return _$PatchPersonalDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatchPersonalDataToJson(this);

  PatchPersonalData copyWith({
    String? name,
    String? phoneNumber,
    String? email,
    String? designation,
    String? dateOfBirth,
    String? bloodGroup,
    String? homeAddress,
    List<PersonalPhoto>? photos,
    int? businessCategoryId,
  }) {
    return PatchPersonalData(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      designation: designation ?? this.designation,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      homeAddress: homeAddress ?? this.homeAddress,
      photos: photos ?? this.photos,
      businessCategoryId: businessCategoryId ?? this.businessCategoryId,
    );
  }
}
