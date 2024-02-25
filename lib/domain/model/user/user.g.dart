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
      phoneNumber: json['phone_number'] as String?,
      websiteLink: json['website_link'] as String?,
      id: json['id'] as int?,
      localId: json['localId'] as int?,
    )..isVerified = json['is_verified'] as bool?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'company_name': instance.companyName,
      'address': instance.address,
      'is_business': instance.isBusiness,
      'is_verified': instance.isVerified,
      'phone_number': instance.phoneNumber,
      'website_link': instance.websiteLink,
      'id': instance.id,
      'localId': instance.localId,
    };
