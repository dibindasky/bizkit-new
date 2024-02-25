// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      password: json['password'] as String?,
      websiteLink: json['website_link'] as String?,
      companyName: json['company_name'] as String?,
      address: json['address'] as String?,
      isBusiness: json['is_business'] as bool? ?? true,
      isVerified: json['is_verified'] as bool? ?? false,
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'website_link': instance.websiteLink,
      'password': instance.password,
      'company_name': instance.companyName,
      'address': instance.address,
      'is_business': instance.isBusiness,
      'is_verified': instance.isVerified,
    };
