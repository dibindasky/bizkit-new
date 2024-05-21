// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image_add.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductImageAdd _$ProductImageAddFromJson(Map<String, dynamic> json) =>
    ProductImageAdd(
      productId: json['product_id'] as int?,
      image: (json['image'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductImageAddToJson(ProductImageAdd instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'image': instance.image,
    };
