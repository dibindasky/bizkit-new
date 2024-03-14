// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as int?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      profilePic: json['profile_pic'] as String?,
      name: json['name'] as String?,
      company: json['company'] as String?,
      websiteLink: json['website_link'] as String?,
      address: json['address'] as String?,
      isBusiness: json['is_business'] as bool?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'profile_pic': instance.profilePic,
      'name': instance.name,
      'company': instance.company,
      'website_link': instance.websiteLink,
      'address': instance.address,
      'is_business': instance.isBusiness,
    };
