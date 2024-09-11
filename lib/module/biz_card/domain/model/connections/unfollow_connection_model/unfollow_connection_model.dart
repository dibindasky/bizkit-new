import 'package:json_annotation/json_annotation.dart';

part 'unfollow_connection_model.g.dart';

@JsonSerializable()
class UnfollowConnectionModel {
  @JsonKey(name: 'connection_id')
  String? connectionId;

  UnfollowConnectionModel({this.connectionId});

  factory UnfollowConnectionModel.fromJson(Map<String, dynamic> json) {
    return _$UnfollowConnectionModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UnfollowConnectionModelToJson(this);
}
