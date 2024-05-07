// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_company_users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCompanyUsersModel _$GetCompanyUsersModelFromJson(
        Map<String, dynamic> json) =>
    GetCompanyUsersModel(
      count: json['count'] as int?,
      next: json['next'],
      previous: json['previous'],
      companyUsers: (json['results'] as List<dynamic>?)
          ?.map((e) => CompanyUsers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCompanyUsersModelToJson(
        GetCompanyUsersModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.companyUsers,
    };
