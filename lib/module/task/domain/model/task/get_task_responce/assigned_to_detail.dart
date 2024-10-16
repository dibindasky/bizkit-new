import 'package:json_annotation/json_annotation.dart';

part 'assigned_to_detail.g.dart';

@JsonSerializable()
class AssignedToDetail {
  // Local ID
  int? localId;

  @JsonKey(name: 'user')
  String? userId;
  String? name;
  @JsonKey(name: 'is_accepted')
  String? isAccepted;

  AssignedToDetail({this.userId, this.name, this.isAccepted});

  factory AssignedToDetail.fromJson(Map<String, dynamic> json) {
    return _$AssignedToDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AssignedToDetailToJson(this);

  static const colTaskAssignedToDetailLocalId =
      'task_assigned_to_detail_local_id';

  static const colTaskAssignedToDetailUserId =
      'task_assigned_to_detail_user_id';
  static const colTaskAssignedToDetailUserName =
      'task_assigned_to_detail_username';
  static const colTaskAssignedToDetailIsAccepted =
      'task_assigned_to_detail_is_accepted';

  static const ccolTaskAssignedToDetailReferenceId =
      'task_assigned_to_detail_reference_id ';
}
