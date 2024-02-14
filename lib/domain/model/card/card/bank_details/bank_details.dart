import 'package:json_annotation/json_annotation.dart';

import '../accredition/accredition.dart';

part 'bank_details.g.dart';

@JsonSerializable()
class BankDetails {
  int? id;
  List<Accredition>? accredition;
  @JsonKey(name: 'name_of_company')
  String? nameOfCompany;
  @JsonKey(name: 'account_number')
  String? accountNumber;
  @JsonKey(name: 'ifsc_code')
  String? ifscCode;
  @JsonKey(name: 'upi_details')
  String? upiDetails;
  @JsonKey(name: 'gst_membership_details')
  String? gstMembershipDetails;
  @JsonKey(name: 'branch_offices')
  String? branchOffices;

  BankDetails({
    this.id,
    this.accredition,
    this.nameOfCompany,
    this.accountNumber,
    this.ifscCode,
    this.upiDetails,
    this.gstMembershipDetails,
    this.branchOffices,
  });

  factory BankDetails.fromJson(Map<String, dynamic> json) {
    return _$BankDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BankDetailsToJson(this);
}
