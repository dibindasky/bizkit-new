import 'package:json_annotation/json_annotation.dart';

part 'next_action_date_responce.g.dart';

@JsonSerializable()
class NextActionDateResponce {
  // Local ID
  int? localId;

  @JsonKey(name: 'user_name')
  String? userName;
  @JsonKey(name: 'user_email')
  String? userEmail;
  @JsonKey(name: 'user_profile')
  dynamic userProfile;
  @JsonKey(name: 'user_id')
  String? userId;
  String? date;
  String? description;

  NextActionDateResponce({
    this.userName,
    this.userEmail,
    this.userProfile,
    this.userId,
    this.date,
    this.description,
  });

  factory NextActionDateResponce.fromJson(Map<String, dynamic> json) {
    return _$NextActionDateResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NextActionDateResponceToJson(this);

  static const colTaskNextActionDatesLocalId =
      'task_next_action_dates_local_id';

  static const colTaskId = 'task_id';
  static const colCurrentUserId = 'user_id';

  static const colNextActionDate = 'task_next_action_date';
  static const colNextActionDateDescription =
      'task_next_action_date_description';
  static const colNextActionDateUserId = 'task_next_action_date_user_id';
  static const colNextActionDateUserName = 'task_next_action_date_user_name';
  static const colNextActionDateUserEmail = 'task_next_action_date_user_email';
  static const colNextActionDateUserProfile =
      'task_next_action_date_user_profile';
}
