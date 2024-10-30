import 'package:json_annotation/json_annotation.dart';

part 'delete_attachments_model.g.dart';

@JsonSerializable()
class DeleteAttachmentsModel {
	@JsonKey(name: 'task_id')
	String? taskId;
	List<String>? attachments;

	DeleteAttachmentsModel({this.taskId, this.attachments});

	factory DeleteAttachmentsModel.fromJson(Map<String, dynamic> json) {
		return _$DeleteAttachmentsModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$DeleteAttachmentsModelToJson(this);
}
