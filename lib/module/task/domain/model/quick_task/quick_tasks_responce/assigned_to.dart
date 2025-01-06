import 'package:json_annotation/json_annotation.dart';

part 'assigned_to.g.dart';

@JsonSerializable()
class QuickTaskAssignedToResponce {
  // Local ID
  int? localId;

  @JsonKey(name: 'user_id')
  String? userId;
  String? name;
  String? status;
  @JsonKey(name: 'profile_picture')
  dynamic profilePicture;

  QuickTaskAssignedToResponce(
      {this.userId, this.name, this.profilePicture, this.status});

  factory QuickTaskAssignedToResponce.fromJson(Map<String, dynamic> json,
      {bool formLocalDb = false}) {
    if (formLocalDb) {
      return QuickTaskAssignedToResponce(
          name: json[colQuickTaskAssignedToUserName],
          profilePicture: json[colQuickTaskAssignedToUserProfilePicture],
          status: json[colQuickTaskAssignedToStatus],
          userId: json[colQuickTaskAssignedToUserId]);
    }
    return _$AssignedToFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AssignedToToJson(this);

  static const colQuickTaskAssignedToLocalId =
      'quick_task_assigned_to_local_id';

  static const colQuickTaskAssignedToUserId = 'quick_task_assigned_to_user_id';
  static const colQuickTaskAssignedToUserName =
      'quick_task_assigned_to_user_name';
  static const colQuickTaskAssignedToStatus = 'quick_task_assigned_to_status';
  static const colQuickTaskAssignedToUserProfilePicture =
      'quick_task_assigned_to_user_profile_picture';

  static const colQuickTaskAssignedToReferenceId =
      'quick_task_assigned_to_reference_id';
}
