// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
      attachment: json['attachment'] as String?,
      type: json['type'] as String?,
    )..localId = json['localId'] as int?;

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'attachment': instance.attachment,
      'type': instance.type,
    };
