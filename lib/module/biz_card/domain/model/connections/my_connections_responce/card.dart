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
  DateTime? connectedDate;
  @JsonKey(name: 'image_url')
  dynamic imageUrl;
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

  static const String colLocalId='local_id';
  static const String colCollectionId = 'connection_id';
  static const String colCard = 'to_card';
  static const String colUSer = 'to_user';
  static const String colName = 'name';
  static const String colBusinessName = 'business_name';
  static const String colBusinessDesignation= 'business_designation';
  static const String colConnectedDate = 'connected_date';
  static const String colImageUrl = 'image_url';
  static const String colConnectedVirQr = 'connected_via_qr';

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);
}
