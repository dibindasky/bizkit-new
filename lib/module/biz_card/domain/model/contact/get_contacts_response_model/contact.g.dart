// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) => ContactModel(
      id: json['id'] as int?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      companyName: json['company_name'] as String?,
      address: json['address'] as String?,
      isBusiness: json['is_business'] as bool?,
      password: json['password'] as String?,
      phoneNumber: json['phone_number'] as String?,
      photo: json['photo_url'] as String?,
      localId: json['localId'] as int?,
    );

Map<String, dynamic> _$ContactModelToJson(ContactModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'company_name': instance.companyName,
      'address': instance.address,
      'is_business': instance.isBusiness,
      'password': instance.password,
      'phone_number': instance.phoneNumber,
      'photo_url': instance.photo,
      'localId': instance.localId,
    };
