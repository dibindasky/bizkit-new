import 'package:json_annotation/json_annotation.dart';

part 'block_bizkit_connection.g.dart';

@JsonSerializable()
class BlockBizkitConnection {
  @JsonKey(name: 'is_blocked')
  bool? isBlock;

  BlockBizkitConnection({this.isBlock});

  factory BlockBizkitConnection.fromJson(Map<String, dynamic> json) {
    return _$BlockBizkitConnectionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BlockBizkitConnectionToJson(this);
}
