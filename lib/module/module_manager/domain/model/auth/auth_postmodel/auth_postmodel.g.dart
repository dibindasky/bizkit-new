// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_postmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthPostmodel _$AuthPostmodelFromJson(Map<String, dynamic> json) =>
    AuthPostmodel(
      otp: json['otp'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$AuthPostmodelToJson(AuthPostmodel instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
    };
