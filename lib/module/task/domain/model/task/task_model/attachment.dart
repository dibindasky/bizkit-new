import 'package:json_annotation/json_annotation.dart';

part 'attachment.g.dart';

@JsonSerializable()
class Attachment {
  String? attachment;
  String? type;
  @JsonKey(name: 'local_id')
  String? localId;

  Attachment({this.attachment, this.type, this.localId});

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return _$AttachmentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}
