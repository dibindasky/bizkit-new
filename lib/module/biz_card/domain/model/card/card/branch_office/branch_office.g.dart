// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_office.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchOffice _$BranchOfficeFromJson(Map<String, dynamic> json) => BranchOffice(
      id: json['id'] as int?,
      branch: json['branch'] as String?,
      cardId: json['card_id'] as int?,
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$BranchOfficeToJson(BranchOffice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch': instance.branch,
      'card_id': instance.cardId,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
    };
