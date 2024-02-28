import 'package:bizkit/domain/model/card/create_card/accridition/accredition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_details.g.dart';

@JsonSerializable()
class BankDetailsCreate {
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

  BankDetailsCreate({
    this.nameOfCompany,
    this.acccountNumber,
    this.ifscCode,
    this.upiDetails,
    this.gstMembershipDetails,
    this.branchOffices,
  });

  factory BankDetailsCreate.fromJson(Map<String, dynamic> json) {
    return _$BankDetailsCreateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BankDetailsCreateToJson(this);

  BankDetailsCreate copyWith({
    List<AccreditionCreate>? accredition,
    String? nameOfCompany,
    String? acccountNumber,
    String? ifscCode,
    String? upiDetails,
    String? gstMembershipDetails,
    String? branchOffices,
  }) {
    return BankDetailsCreate(
      nameOfCompany: nameOfCompany ?? this.nameOfCompany,
      acccountNumber: acccountNumber ?? this.acccountNumber,
      ifscCode: ifscCode ?? this.ifscCode,
      upiDetails: upiDetails ?? this.upiDetails,
      gstMembershipDetails: gstMembershipDetails ?? this.gstMembershipDetails,
      branchOffices: branchOffices ?? this.branchOffices,
    );
  }
}
