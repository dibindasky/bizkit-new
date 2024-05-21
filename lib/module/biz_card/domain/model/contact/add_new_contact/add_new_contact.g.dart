// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewContact _$AddNewContactFromJson(Map<String, dynamic> json) =>
    AddNewContact(
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      companyName: json['companyName'] as String?,
    );

Map<String, dynamic> _$AddNewContactToJson(AddNewContact instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'companyName': instance.companyName,
    };
