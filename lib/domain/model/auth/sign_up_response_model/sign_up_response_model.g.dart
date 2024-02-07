// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponseModel _$SignUpResponseModelFromJson(Map<String, dynamic> json) =>
    SignUpResponseModel(
      message: json['message'] as String?,
      id: json['id'] as int?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      business: json['business'] as bool?,
    );

Map<String, dynamic> _$SignUpResponseModelToJson(
        SignUpResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'id': instance.id,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'business': instance.business,
    };
