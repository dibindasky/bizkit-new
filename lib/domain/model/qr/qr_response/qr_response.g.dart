// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrResponse _$QrResponseFromJson(Map<String, dynamic> json) => QrResponse(
      message: json['message'] as String?,
      id: json['id'] as int?,
      qrCode: json['qr_code'] as String?,
    );

Map<String, dynamic> _$QrResponseToJson(QrResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'id': instance.id,
      'qr_code': instance.qrCode,
    };
