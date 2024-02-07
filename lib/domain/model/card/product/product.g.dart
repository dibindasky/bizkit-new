// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      enquiry: json['enquiry'] as bool?,
      label: json['label'] as String?,
      description: json['description'] as String?,
      product: json['product'],
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'enquiry': instance.enquiry,
      'label': instance.label,
      'description': instance.description,
      'product': instance.product,
    };
