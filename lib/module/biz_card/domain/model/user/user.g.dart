// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String?,
      name: json['name'] as String?,
      companyName: json['company'] as String?,
      address: json['address'] as String?,
      isBusiness: json['is_business'] as bool?,
      phoneNumber: json['phone_number'] as String?,
      websiteLink: json['website_link'] as String?,
      isVerified: json['is_verified'] as bool?,
      id: json['id'] as int?,
      localId: json['localId'] as int?,
      hasCard: json['has_card'] as bool?,
      isLogined: json['is_logined'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'company': instance.companyName,
      'address': instance.address,
      'is_business': instance.isBusiness,
      'is_verified': instance.isVerified,
      'phone_number': instance.phoneNumber,
      'website_link': instance.websiteLink,
      'has_card': instance.hasCard,
      'is_logined': instance.isLogined,
      'id': instance.id,
      'localId': instance.localId,
    };
