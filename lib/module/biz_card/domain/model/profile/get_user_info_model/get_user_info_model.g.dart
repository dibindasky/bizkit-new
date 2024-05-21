// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserInfoModel _$GetUserInfoModelFromJson(Map<String, dynamic> json) =>
    GetUserInfoModel(
      results: json['results'] == null
          ? null
          : Result.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserInfoModelToJson(GetUserInfoModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
