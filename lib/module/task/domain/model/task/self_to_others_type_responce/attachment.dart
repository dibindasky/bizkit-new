import 'package:json_annotation/json_annotation.dart';

part 'attachment.g.dart';

@JsonSerializable()
class Attachments {
  String? attachment;
  String? type;

  Attachments({this.attachment, this.type});

  factory Attachments.fromJson(Map<String, dynamic> json) {
    return _$AttachmentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttachmentsToJson(this);
}
