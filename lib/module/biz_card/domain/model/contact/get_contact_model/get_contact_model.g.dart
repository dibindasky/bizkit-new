// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetContactModel _$GetContactModelFromJson(Map<String, dynamic> json) =>
    GetContactModel(
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GetContactModelToJson(GetContactModel instance) =>
    <String, dynamic>{
      'phone_numbers': instance.phoneNumbers,
    };
