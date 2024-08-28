import 'package:json_annotation/json_annotation.dart';

part 'business_branch_model.g.dart';

@JsonSerializable()
class BusinessBranchModel {
  @JsonKey(name: 'branch_location')
  String? branchLocation;
  @JsonKey(name: 'branch_address')
  String? branchAddress;
  @JsonKey(name: 'branch_contact_person')
  String? branchContactPerson;
  @JsonKey(name: 'branch_contact_number')
  String? branchContactNumber;
  @JsonKey(name: 'business_details_id')
  String? businessDetailsId;
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'branch_office_id')
  String? branchId;

  BusinessBranchModel({
    this.branchId,
    this.branchLocation,
    this.branchAddress,
    this.branchContactPerson,
    this.branchContactNumber,
    this.businessDetailsId,
    this.bizcardId,
  });

  factory BusinessBranchModel.fromJson(Map<String, dynamic> json) {
    return _$BusinessBranchModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessBranchModelToJson(this);
}
