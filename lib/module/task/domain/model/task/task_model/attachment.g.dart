// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
      attachment: json['attachment'] as String?,
      type: json['type'] as String?,
      localId: json['local_id'] as String?,
    );

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'attachment': instance.attachment,
      'type': instance.type,
      'local_id': instance.localId,
    };
