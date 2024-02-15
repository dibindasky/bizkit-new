// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int?,
      product: json['product'] as String?,
      enquiry: json['enquiry'] as bool?,
      label: json['label'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'enquiry': instance.enquiry,
      'label': instance.label,
      'description': instance.description,
    };
