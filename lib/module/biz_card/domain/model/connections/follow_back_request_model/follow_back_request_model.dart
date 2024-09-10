import 'package:json_annotation/json_annotation.dart';

part 'follow_back_request_model.g.dart';

@JsonSerializable()
class FollowBackRequestModel {
  @JsonKey(name: 'to_user')
  String? toUser;

  FollowBackRequestModel({this.toUser});

  factory FollowBackRequestModel.fromJson(Map<String, dynamic> json) {
    return _$FollowBackRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FollowBackRequestModelToJson(this);
}
