import 'package:json_annotation/json_annotation.dart';

part 'user_name_changin_request_model.g.dart';

@JsonSerializable()
class UserNameChanginRequestModel {
  @JsonKey(name: 'Oldenamne')
  String? username;

  UserNameChanginRequestModel({this.username});

  factory UserNameChanginRequestModel.fromJson(Map<String, dynamic> json) {
    return _$UserNameChanginRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserNameChanginRequestModelToJson(this);
}
