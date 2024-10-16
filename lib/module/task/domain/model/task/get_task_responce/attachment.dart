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

  // List comparison function for Attachment (ignores order)
  static bool compareAttachmentLists(
      List<Attachment>? list1, List<Attachment>? list2) {
    if (list1 == null && list2 == null) return true;
    if (list1 == null || list2 == null || list1.length != list2.length) {
      return false;
    }

    final map1 = {for (var attach in list1) attach.attachment: attach};
    final map2 = {for (var attach in list2) attach.attachment: attach};

    if (map1.length != map2.length) return false;

    for (var id in map1.keys) {
      if (!map2.containsKey(id)) return false;
      if (!map1[id]!.equals(map2[id]!)) return false;
    }

    return true;
  }

  static const colTaskAttachmentLocalId = 'task_attachment_local_id';

  static const colTaskAttachment = 'task_attachment';
  static const colTaskAttachmentType = 'task_attachment_type';

  static const colTaskAttachmentReferenceId = 'task_attachment_reference_id';
}
