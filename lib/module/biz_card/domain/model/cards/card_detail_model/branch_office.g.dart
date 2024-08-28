// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_office.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchOffice _$BranchOfficeFromJson(Map<String, dynamic> json) => BranchOffice(
      branchLocation: json['branch_location'] as String?,
      branchAddress: json['branch_address'] as String?,
      branchContactNumber: json['branch_contact_number'] as String?,
      branchContactPerson: json['branch_contact_person'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$BranchOfficeToJson(BranchOffice instance) =>
    <String, dynamic>{
      'branch_location': instance.branchLocation,
      'branch_address': instance.branchAddress,
      'branch_contact_number': instance.branchContactNumber,
      'branch_contact_person': instance.branchContactPerson,
      '_id': instance.id,
    };
