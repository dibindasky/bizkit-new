import 'package:json_annotation/json_annotation.dart';

part 'branch_office.g.dart';

@JsonSerializable()
class BranchOffice {
  @JsonKey(name: 'branch_location')
  String? branchLocation;
  @JsonKey(name: 'branch_address')
  String? branchAddress;
  @JsonKey(name: 'branch_contact_number')
  String? branchContactNumber;
  @JsonKey(name: 'branch_contact_person')
  String? branchContactPerson;
  @JsonKey(name: '_id')
  String? id;

  BranchOffice({
    this.branchLocation,
    this.branchAddress,
    this.branchContactNumber,
    this.branchContactPerson,
    this.id,
  });

  factory BranchOffice.fromJson(Map<String, dynamic> json) {
    return _$BranchOfficeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BranchOfficeToJson(this);
}
