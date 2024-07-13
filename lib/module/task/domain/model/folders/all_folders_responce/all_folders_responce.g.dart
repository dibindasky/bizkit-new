// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_folders_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllFoldersResponce _$AllFoldersResponceFromJson(Map<String, dynamic> json) =>
    AllFoldersResponce(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllFoldersResponceToJson(AllFoldersResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
