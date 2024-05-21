import 'package:json_annotation/json_annotation.dart';

part 'bizkit_connection.g.dart';

@JsonSerializable()
class BizkitConnection {
  int? id;
  @JsonKey(name: 'image')
  String? photos;
  String? name;
  String? designation;
  String? company;
  @JsonKey(name: 'is_accepted')
  bool? isAccepted;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'is_block')
  bool? isBlock;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'card_id')
  int? cardId;

  BizkitConnection({
    this.id,
    this.photos,
    this.name,
    this.designation,
    this.company,
    this.isAccepted,
    this.isBlock,
    this.userId,
    this.cardId,
    this.isVerified,
  });

  factory BizkitConnection.fromJson(Map<String, dynamic> json) {
    return _$BizkitConnectionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BizkitConnectionToJson(this);
}
