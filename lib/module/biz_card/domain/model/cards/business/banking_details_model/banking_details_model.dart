import 'package:json_annotation/json_annotation.dart';

part 'banking_details_model.g.dart';

@JsonSerializable()
class BankingDetailsModel {
  @JsonKey(name: 'business_details_id')
  String? businessDetailsId;
  @JsonKey(name: 'banking_name')
  String? bankingName;
  @JsonKey(name: 'account_number')
  String? accountNumber;
  @JsonKey(name: 'IFSC_code')
  String? ifscCode;
  @JsonKey(name: 'UPI')
  String? upi;
  @JsonKey(name: 'GST')
  String? gst;

  BankingDetailsModel({
    this.businessDetailsId,
    this.bankingName,
    this.accountNumber,
    this.ifscCode,
    this.upi,
    this.gst,
  });

  factory BankingDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$BankingDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BankingDetailsModelToJson(this);
}
