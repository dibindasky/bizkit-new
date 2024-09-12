import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

@JsonSerializable()
class Card {
  @JsonKey(name: 'connection_id')
  String? connectionId;
  @JsonKey(name: 'to_user')
  String? toUser;
  String? name;
  @JsonKey(name: 'to_card')
  String? toCard;
  @JsonKey(name: 'business_name')
  String? businessName;
  @JsonKey(name: 'business_designation')
  String? businessDesignation;
  @JsonKey(name: 'connected_date')
  String? connectedDate;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  @JsonKey(name: 'connected_via_qr')
  bool? connectedViaQr;

  Card({
    this.connectionId,
    this.toUser,
    this.name,
    this.toCard,
    this.businessName,
    this.businessDesignation,
    this.connectedDate,
    this.imageUrl,
    this.connectedViaQr,
  });

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);
}
