import 'package:json_annotation/json_annotation.dart';

part 'attachment.g.dart';

@JsonSerializable()
class Attachment {
  // Local ID
  int? localId;

  String? attachment;
  String? type;

  Attachment({this.attachment, this.type});

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return _$AttachmentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttachmentToJson(this);

  // equals function to compare Attachment objects
  bool equals(Attachment other) {
    return attachment == other.attachment && type == other.type;
  }

  static const colTaskAttachmentLocalId = 'task_attachment_local_id';

  static const colTaskAttachment = 'task_attachment';
  static const colTaskAttachmentType = 'task_attachment_type';

  static const colTaskAttachmentReferenceId = 'task_attachment_reference_id';
}
