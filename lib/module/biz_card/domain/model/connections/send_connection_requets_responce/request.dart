import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class SendConnectionRequet {
  @JsonKey(name: 'request_id')
  String? requestId;
  @JsonKey(name: 'to_user_id')
  String? toUserId;
  @JsonKey(name: 'to_user_name')
  String? toUserName;
  @JsonKey(name: 'to_user_profile_picture')
  String? toUserProfilePicture;
  @JsonKey(name: 'from_user_id')
  String? fromUserId;
  @JsonKey(name: 'from_card_id')
  String? fromCardId;
  @JsonKey(name: 'to_user_designation')
  String? toUserDesignation;

  SendConnectionRequet({
    this.requestId,
    this.toUserId,
    this.toUserName,
    this.toUserProfilePicture,
    this.fromUserId,
    this.toUserDesignation,
    this.fromCardId,
  });

  factory SendConnectionRequet.fromJson(Map<String, dynamic> json) {
    return _$SendConnectionRequetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendConnectionRequetToJson(this);
}
