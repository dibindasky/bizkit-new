import 'package:bizkit/domain/model/card/accredition/accredition.dart';
import 'package:json_annotation/json_annotation.dart';


part 'bank_details.g.dart';

@JsonSerializable()
class BankDetails {
  List<Accredition>? accredition;
  @JsonKey(name: 'name_of_company')
  dynamic nameOfCompany;
  @JsonKey(name: 'acccount_number')
  dynamic acccountNumber;
  @JsonKey(name: 'ifsc_code')
  dynamic ifscCode;
  @JsonKey(name: 'upi_details')
  dynamic upiDetails;
  @JsonKey(name: 'gst_membership_details')
  dynamic gstMembershipDetails;
  @JsonKey(name: 'branch_offices')
  dynamic branchOffices;

  BankDetails({
    this.accredition,
    this.nameOfCompany,
    this.acccountNumber,
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
