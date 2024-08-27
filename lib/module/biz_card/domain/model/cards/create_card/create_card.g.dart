// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCard _$CreateCardFromJson(Map<String, dynamic> json) => CreateCard(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone:
          (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList(),
      businessCategory: json['business_category'] as String?,
      designation: json['designation'] as String?,
      companyName: json['company_name'] as String?,
    );

Map<String, dynamic> _$CreateCardToJson(CreateCard instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'business_category': instance.businessCategory,
      'designation': instance.designation,
      'company_name': instance.companyName,
    };
