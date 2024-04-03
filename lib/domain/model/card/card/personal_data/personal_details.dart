import 'package:bizkit/domain/model/card/card/business_category_card/business_category_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'personal_details.g.dart';

@JsonSerializable()
class PersonalDetails {
  int? id;
  String? photos;
  String? name;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? email;
  String? company;
  @JsonKey(name: 'business_category')
  BusinessCategoryCard? businessCategory;
  @JsonKey(name: 'business_category_id')
  int? businessCategoryId;
  @JsonKey(name: 'home_address')
  String? homeAddress;
  @JsonKey(name: 'blood_group')
  String? bloodGroup;
  @JsonKey(name: 'date_of_birth')
  String? dateOfBirth;
  String? designation;

  PersonalDetails({
    this.id,
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
