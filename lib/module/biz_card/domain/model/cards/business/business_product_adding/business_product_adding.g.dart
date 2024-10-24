// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_product_adding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessProductAdding _$BusinessProductAddingFromJson(
        Map<String, dynamic> json) =>
    BusinessProductAdding(
      title: json['title'] as String?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      productId: json['product_id'] as String?,
      enquiry: json['enquiry'] as bool?,
      businessDetailsId: json['business_details_id'] as String?,
      bizcardId: json['bizcard_id'] as String?,
    );

Map<String, dynamic> _$BusinessProductAddingToJson(
        BusinessProductAdding instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'images': instance.images,
      'enquiry': instance.enquiry,
      'business_details_id': instance.businessDetailsId,
      'bizcard_id': instance.bizcardId,
      'product_id': instance.productId,
    };
