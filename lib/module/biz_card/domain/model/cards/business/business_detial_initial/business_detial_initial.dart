import 'package:json_annotation/json_annotation.dart';

part 'business_detial_initial.g.dart';

@JsonSerializable()
class BusinessDetialInitial {
  @JsonKey(name: 'business_name')
  String? businessName;
  @JsonKey(name: 'business_emai')
  String? businessEmail;
  @JsonKey(name: 'bussiness_phone')
  List<String>? bussinessPhone;
  @JsonKey(name: 'business_website')
  String? websiteLink;
  @JsonKey(name: 'business_details_id')
  String? businessDetailsId;

  BusinessDetialInitial({
    this.websiteLink,
    this.businessName,
    this.businessEmail,
    this.bussinessPhone,
    this.businessDetailsId,
  });

  factory BusinessDetialInitial.fromJson(Map<String, dynamic> json) {
    return _$BusinessDetialInitialFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessDetialInitialToJson(this);
}
