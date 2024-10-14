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

  static const String colLocalId='local_id';
  static const String colToUser='to_user';
  static const String colUserNmae='username';

  Map<String, dynamic> toJson() => _$ConnectionToJson(this);
}
