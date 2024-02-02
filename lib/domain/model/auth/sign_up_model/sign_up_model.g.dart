// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      companyName: json['company_name'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'password': instance.password,
      'name': instance.name,
      'company_name': instance.companyName,
      'address': instance.address,
    };
