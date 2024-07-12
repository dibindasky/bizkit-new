// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_post_phone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthPostPhoneModel _$AuthPostPhoneModelFromJson(Map<String, dynamic> json) =>
    AuthPostPhoneModel(
      otp: json['otp'] as String?,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$AuthPostPhoneModelToJson(AuthPostPhoneModel instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'phone_number': instance.phoneNumber,
    };
