import 'package:json_annotation/json_annotation.dart';

import 'profile.dart';

part 'user_view.g.dart';

@JsonSerializable()
class UserView {
  int? id;
  Profile? profile;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'card_id')
  int? cardId;

  UserView({this.id, this.profile, this.userId, this.cardId});

  factory UserView.fromJson(Map<String, dynamic> json) {
    return _$UserViewFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserViewToJson(this);
}
