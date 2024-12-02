// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employees_list_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeesListResponce _$EmployeesListResponceFromJson(
        Map<String, dynamic> json) =>
    EmployeesListResponce(
      employees: (json['employees'] as List<dynamic>?)
          ?.map((e) => Employee.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['has_more'] as bool?,
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EmployeesListResponceToJson(
        EmployeesListResponce instance) =>
    <String, dynamic>{
      'employees': instance.employees,
      'has_more': instance.hasMore,
      'page': instance.page,
      'page_size': instance.pageSize,
    };
