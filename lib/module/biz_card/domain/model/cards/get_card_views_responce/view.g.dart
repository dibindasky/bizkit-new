// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Views _$ViewsFromJson(Map<String, dynamic> json) => Views(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      photo: json['photo'],
    );

Map<String, dynamic> _$ViewsToJson(Views instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'photo': instance.photo,
    };
