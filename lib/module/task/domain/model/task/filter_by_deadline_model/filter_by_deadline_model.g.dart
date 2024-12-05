// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_by_deadline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterByDeadlineModel _$FilterByDeadlineModelFromJson(
        Map<String, dynamic> json) =>
    FilterByDeadlineModel(
      date: json['date'] as String?,
      page: json['page'] as int?,
      pageSize: json['page_size'] as int?,
    )..localId = json['localId'] as int?;

Map<String, dynamic> _$FilterByDeadlineModelToJson(
        FilterByDeadlineModel instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'date': instance.date,
      'page': instance.page,
      'page_size': instance.pageSize,
    };
