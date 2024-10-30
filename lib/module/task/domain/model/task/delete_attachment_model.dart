class DeleteAttachmentModel {
	String? taskId;
	List<String>? attachments;

	DeleteAttachmentModel({this.taskId, this.attachments});

	factory DeleteAttachmentModel.fromJson(Map<String, dynamic> json) {
		return DeleteAttachmentModel(
			taskId: json['task_id'] as String?,
			attachments: json['attachments'] as List<String>?,
		);
	}



	Map<String, dynamic> toJson() => {
				'task_id': taskId,
				'attachments': attachments,
			};
}
