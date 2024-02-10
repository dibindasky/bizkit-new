import 'package:bizkit/domain/model/card/create_card/accridition/accredition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_details.g.dart';

@JsonSerializable()
class BankDetails {
  List<Accredition>? accredition;
  @JsonKey(name: 'name_of_company')
  String? nameOfCompany;
  @JsonKey(name: 'account_number')
  String? acccountNumber;
  @JsonKey(name: 'ifsc_code')
  String? ifscCode;
  @JsonKey(name: 'upi_details')
  String? upiDetails;
  @JsonKey(name: 'gst_membership_details')
  String? gstMembershipDetails;
  @JsonKey(name: 'branch_offices')
  String? branchOffices;

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

  BankDetails copyWith({
    List<Accredition>? accredition,
    String? nameOfCompany,
    String? acccountNumber,
    String? ifscCode,
    String? upiDetails,
    String? gstMembershipDetails,
    String? branchOffices,
  }) {
    return BankDetails(
      accredition: accredition ?? this.accredition,
      nameOfCompany: nameOfCompany ?? this.nameOfCompany,
      acccountNumber: acccountNumber ?? this.acccountNumber,
      ifscCode: ifscCode ?? this.ifscCode,
      upiDetails: upiDetails ?? this.upiDetails,
      gstMembershipDetails: gstMembershipDetails ?? this.gstMembershipDetails,
      branchOffices: branchOffices ?? this.branchOffices,
    );
  }
}
