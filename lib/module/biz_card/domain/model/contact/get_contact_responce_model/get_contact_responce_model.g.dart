// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_contact_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetContactResponceModel _$GetContactResponceModelFromJson(
        Map<String, dynamic> json) =>
    GetContactResponceModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ContactModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetContactResponceModelToJson(
        GetContactResponceModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
