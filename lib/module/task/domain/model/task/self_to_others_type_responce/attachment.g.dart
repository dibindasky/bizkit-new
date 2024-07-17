// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachments _$AttachmentsFromJson(Map<String, dynamic> json) => Attachments(
      attachment: json['attachment'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$AttachmentsToJson(Attachments instance) =>
    <String, dynamic>{
      'attachment': instance.attachment,
      'type': instance.type,
    };
