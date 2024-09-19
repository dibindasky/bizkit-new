// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectionDetail _$ConnectionDetailFromJson(Map<String, dynamic> json) =>
    ConnectionDetail(
      connectionId: json['connection_id'] as String?,
      notes: json['notes'] as String?,
      occasion: json['occasion'] as String?,
      location: json['location'] as String?,
      category: json['category'] as String?,
      selfie: json['selfie'] == null
          ? null
          : (json['selfie'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ConnectionDetailToJson(ConnectionDetail instance) =>
    <String, dynamic>{
      'connection_id': instance.connectionId,
      'notes': instance.notes,
      'occasion': instance.occasion,
      'location': instance.location,
      'category': instance.category,
      'selfie': instance.selfie,
    };
