// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankDetails _$BankDetailsFromJson(Map<String, dynamic> json) => BankDetails(
      accredition: (json['accredition'] as List<dynamic>?)
          ?.map((e) => Accredition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nameOfCompany: json['name_of_company'],
      acccountNumber: json['acccount_number'],
      ifscCode: json['ifsc_code'],
      upiDetails: json['upi_details'],
      gstMembershipDetails: json['gst_membership_details'],
      branchOffices: json['branch_offices'],
    );

Map<String, dynamic> _$BankDetailsToJson(BankDetails instance) =>
    <String, dynamic>{
      'accredition': instance.accredition,
      'name_of_company': instance.nameOfCompany,
      'acccount_number': instance.acccountNumber,
      'ifsc_code': instance.ifscCode,
      'upi_details': instance.upiDetails,
      'gst_membership_details': instance.gstMembershipDetails,
      'branch_offices': instance.branchOffices,
    };
