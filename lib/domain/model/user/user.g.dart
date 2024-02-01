// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String?,
      name: json['name'] as String?,
      companyName: json['company_name'] as String?,
      address: json['address'] as String?,
      isBusiness: json['is_business'] as bool?,
      password: json['password'] as String?,
      phoneNumber: json['phone_number'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'company_name': instance.companyName,
      'address': instance.address,
      'is_business': instance.isBusiness,
      'password': instance.password,
      'phone_number': instance.phoneNumber,
      'id': instance.id,
    };
