import 'package:bizkit/module/biz_card/domain/model/level_sharing/shared_fields/shared_fields.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class RecievedConnectionRequest {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'from_user')
  String? fromUser;
  @JsonKey(name: 'to_user')
  String? toUser;
  @JsonKey(name: 'to_card')
  String? toCard;
  dynamic status;
  @JsonKey(name: 'shared_fields')
  SharedFields? sharedFields;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'from_user_name')
  String? fromUserName;
  @JsonKey(name: 'from_user_profile_picture')
  String? fromUserProfilePicture;
  @JsonKey(name: 'from_user_company_name')
  String? fromUserCompanyName;
  @JsonKey(name: 'from_user_designation')
  String? fromUserDesignation;

  RecievedConnectionRequest({
    this.id,
    this.fromUser,
    this.toUser,
    this.toCard,
    this.status,
    this.sharedFields,
    this.createdAt,
    this.updatedAt,
    this.fromUserName,
    this.fromUserProfilePicture,
    this.fromUserCompanyName,
    this.fromUserDesignation,
  });

  factory RecievedConnectionRequest.fromJson(Map<String, dynamic> json) {
    return _$RecievedConnectionRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecievedConnectionRequestToJson(this);
}
