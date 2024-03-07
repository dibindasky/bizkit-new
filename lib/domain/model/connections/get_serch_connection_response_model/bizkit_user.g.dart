// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bizkit_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BizkitUser _$BizkitUserFromJson(Map<String, dynamic> json) => BizkitUser(
      id: json['id'] as int?,
      connectionId: json['connection_request_id'] as int?,
      name: json['name'] as String?,
      company: json['company'] as String?,
      image: json['image'] as String?,
      designation: json['designation'] as String?,
    );

Map<String, dynamic> _$BizkitUserToJson(BizkitUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'company': instance.company,
      'image': instance.image,
      'designation': instance.designation,
      'connection_request_id': instance.connectionId,
    };
