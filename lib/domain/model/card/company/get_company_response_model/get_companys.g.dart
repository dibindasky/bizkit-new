// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_companys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCompanysResponseModel _$GetCompanysResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetCompanysResponseModel(
      companies: (json['companies'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCompanysResponseModelToJson(
        GetCompanysResponseModel instance) =>
    <String, dynamic>{
      'companies': instance.companies,
    };
