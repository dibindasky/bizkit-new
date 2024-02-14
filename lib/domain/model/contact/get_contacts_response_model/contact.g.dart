// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      id: json['id'] as int?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      companyName: json['company_name'] as String?,
      address: json['address'] as String?,
      isBusiness: json['is_business'] as bool?,
      password: json['password'] as String?,
      phoneNumber: json['phone_number'] as String?,
      localId: json['localId'] as int?,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'company_name': instance.companyName,
      'address': instance.address,
      'is_business': instance.isBusiness,
      'password': instance.password,
      'phone_number': instance.phoneNumber,
      'localId': instance.localId,
    };
