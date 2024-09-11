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

  bool? checkLoading;

  SendConnectionRequet({
    this.requestId,
    this.toUserId,
    this.toUserName,
    this.toUserProfilePicture,
    this.fromUserId,
    this.toUserDesignation,
    this.fromCardId,
    this.checkLoading = false,
  });

  factory SendConnectionRequet.fromJson(Map<String, dynamic> json) {
    return _$SendConnectionRequetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendConnectionRequetToJson(this);

  SendConnectionRequet copyWith({
    String? requestId,
    String? toUserId,
    String? toUserName,
    String? toUserProfilePicture,
    String? fromUserId,
    String? fromCardId,
    String? toUserDesignation,
    bool? checkLoading,
  }) {
    return SendConnectionRequet(
      requestId: requestId ?? this.requestId,
      toUserId: toUserId ?? this.toUserId,
      toUserName: toUserName ?? this.toUserName,
      toUserProfilePicture: toUserProfilePicture ?? this.toUserProfilePicture,
      fromUserId: fromUserId ?? this.fromUserId,
      fromCardId: fromCardId ?? this.fromCardId,
      toUserDesignation: toUserDesignation ?? this.toUserDesignation,
      checkLoading: checkLoading ?? this.checkLoading,
    );
  }
}
