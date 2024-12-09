import 'package:json_annotation/json_annotation.dart';

part 'next_action_date_responce.g.dart';

@JsonSerializable()
class NextActionDateResponce {
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
}
