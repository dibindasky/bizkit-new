// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankDetails _$BankDetailsFromJson(Map<String, dynamic> json) => BankDetails(
      nameOfCompany: json['name_of_company'] as String?,
      accountNumber: json['account_number'] as String?,
      ifscCode: json['ifsc_code'] as String?,
      upiDetails: json['upi_details'] as String?,
      gstMembershipDetails: json['gst_membership_details'] as String?,
    );

Map<String, dynamic> _$BankDetailsToJson(BankDetails instance) =>
    <String, dynamic>{
      'name_of_company': instance.nameOfCompany,
      'account_number': instance.accountNumber,
      'ifsc_code': instance.ifscCode,
      'upi_details': instance.upiDetails,
      'gst_membership_details': instance.gstMembershipDetails,
    };
