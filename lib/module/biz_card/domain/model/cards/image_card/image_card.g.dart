// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageCard _$ImageCardFromJson(Map<String, dynamic> json) => ImageCard(
      id: json['id'] as int?,
      image: json['image'] as String?,
      networkImage: json['networkImage'] as bool? ?? false,
    );

Map<String, dynamic> _$ImageCardToJson(ImageCard instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'networkImage': instance.networkImage,
    };
