import 'package:json_annotation/json_annotation.dart';

part 'blocked_connection.g.dart';

@JsonSerializable()
class BlockedConnection {
  int? id;
  dynamic photos;
  String? name;
  String? designation;
  String? company;
  dynamic tag;
  @JsonKey(name: 'is_accepted')
  bool? isAccepted;
  @JsonKey(name: 'is_blocked')
  bool? isBlocked;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'card_id')
  int? cardId;

  BlockedConnection({
    this.id,
    this.photos,
    this.name,
    this.designation,
    this.company,
    this.tag,
    this.isAccepted,
    this.isBlocked,
    this.userId,
    this.cardId,
  });

  factory BlockedConnection.fromJson(Map<String, dynamic> json) {
    return _$BlockedConnectionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BlockedConnectionToJson(this);
}
