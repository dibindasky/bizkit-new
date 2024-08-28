// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banking_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankingDetailsModel _$BankingDetailsModelFromJson(Map<String, dynamic> json) =>
    BankingDetailsModel(
      businessDetailsId: json['business_details_id'] as String?,
      bankingName: json['banking_name'] as String?,
      accountNumber: json['account_number'] as String?,
      ifscCode: json['IFSC_code'] as String?,
      upi: json['UPI'] as String?,
      gst: json['GST'] as String?,
    );

Map<String, dynamic> _$BankingDetailsModelToJson(
        BankingDetailsModel instance) =>
    <String, dynamic>{
      'business_details_id': instance.businessDetailsId,
      'banking_name': instance.bankingName,
      'account_number': instance.accountNumber,
      'IFSC_code': instance.ifscCode,
      'UPI': instance.upi,
      'GST': instance.gst,
    };
