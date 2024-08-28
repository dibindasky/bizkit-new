// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessBranchModel _$BusinessBranchModelFromJson(Map<String, dynamic> json) =>
    BusinessBranchModel(
      branchId: json['branch_office_id'] as String?,
      branchLocation: json['branch_location'] as String?,
      branchAddress: json['branch_address'] as String?,
      branchContactPerson: json['branch_contact_person'] as String?,
      branchContactNumber: json['branch_contact_number'] as String?,
      businessDetailsId: json['business_details_id'] as String?,
      bizcardId: json['bizcard_id'] as String?,
    );

Map<String, dynamic> _$BusinessBranchModelToJson(
        BusinessBranchModel instance) =>
    <String, dynamic>{
      'branch_office_id': instance.branchId,
      'branch_location': instance.branchLocation,
      'branch_address': instance.branchAddress,
      'branch_contact_person': instance.branchContactPerson,
      'branch_contact_number': instance.branchContactNumber,
      'business_details_id': instance.businessDetailsId,
      'bizcard_id': instance.bizcardId,
    };
