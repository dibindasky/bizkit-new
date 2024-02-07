// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_indivudal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpIndivudalModel _$SignUpIndivudalModelFromJson(
        Map<String, dynamic> json) =>
    SignUpIndivudalModel(
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      isBusiness: json['is_business'] as bool? ?? false,
    )
      ..companyName = json['company_name'] as String?
      ..address = json['address'] as String?;

Map<String, dynamic> _$SignUpIndivudalModelToJson(
        SignUpIndivudalModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'password': instance.password,
      'company_name': instance.companyName,
      'name': instance.name,
      'address': instance.address,
      'is_business': instance.isBusiness,
    };
