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
  });

  factory PersonalDetailsRequestModel.fromJson(Map<String, dynamic> json) {
    return _$PersonalDetailsRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalDetailsRequestModelToJson(this);
}
