// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankDetails _$BankDetailsFromJson(Map<String, dynamic> json) => BankDetails(
      id: json['id'] as int?,
      accredition: (json['accredition'] as List<dynamic>?)
          ?.map((e) => Accredition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nameOfCompany: json['name_of_company'] as String?,
      accountNumber: json['account_number'] as String?,
      ifscCode: json['ifsc_code'] as String?,
      upiDetails: json['upi_details'] as String?,
      gstMembershipDetails: json['gst_membership_details'] as String?,
      branchOffices: json['branch_offices'] as String?,
    );

Map<String, dynamic> _$BankDetailsToJson(BankDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accredition': instance.accredition,
      'name_of_company': instance.nameOfCompany,
      'account_number': instance.accountNumber,
      'ifsc_code': instance.ifscCode,
      'upi_details': instance.upiDetails,
      'gst_membership_details': instance.gstMembershipDetails,
      'branch_offices': instance.branchOffices,
    };
