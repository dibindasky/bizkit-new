// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_qr_code_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQrCodeResponseModel _$GetQrCodeResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetQrCodeResponseModel(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => QRModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetQrCodeResponseModelToJson(
        GetQrCodeResponseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
