import 'package:json_annotation/json_annotation.dart';

import 'card.dart';

part 'connection.g.dart';

@JsonSerializable()
class MyConnection {
  @JsonKey(name: 'to_user')
  String? toUser;
  String? username;
  List<Card>? cards;

  MyConnection({this.toUser, this.username, this.cards});

  factory MyConnection.fromJson(Map<String, dynamic> json) {
    return _$ConnectionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConnectionToJson(this);
}
