// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_business_category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBusinessCategoryResponseModel _$GetBusinessCategoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetBusinessCategoryResponseModel(
      businessCategories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBusinessCategoryResponseModelToJson(
        GetBusinessCategoryResponseModel instance) =>
    <String, dynamic>{
      'categories': instance.businessCategories,
    };
