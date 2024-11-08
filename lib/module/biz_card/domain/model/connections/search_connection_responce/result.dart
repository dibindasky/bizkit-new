import 'package:json_annotation/json_annotation.dart';

import 'card.dart';

part 'result.g.dart';

@JsonSerializable()
class SearchConnection {
  @JsonKey(name: 'to_user')
  String? toUser;
  String? username;
  List<Card>? cards;
  
  SearchConnection({this.toUser, this.username, this.cards});

  factory SearchConnection.fromJson(Map<String, dynamic> json) {
    return _$SearchConnectionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchConnectionToJson(this);
}
