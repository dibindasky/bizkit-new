import 'package:json_annotation/json_annotation.dart';

part 'bank_details.g.dart';

@JsonSerializable()
class BankDetails {
  int? id;
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
  @JsonKey(name: 'card_id')
  int? cardId;

  BankDetails(
      {this.id,
      this.nameOfCompany,
      this.accountNumber,
      this.ifscCode,
      this.upiDetails,
      this.gstMembershipDetails,
      this.cardId});

  factory BankDetails.fromJson(Map<String, dynamic> json) {
    return _$BankDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BankDetailsToJson(this);
}
