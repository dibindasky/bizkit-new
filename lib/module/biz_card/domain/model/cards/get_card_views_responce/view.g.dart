// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Views _$ViewFromJson(Map<String, dynamic> json) => Views(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      photo: json['photo'],
    );

Map<String, dynamic> _$ViewToJson(Views instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'photo': instance.photo,
    };
