import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class ConnectionsList {
  @JsonKey(name: 'connection_id')
  String? connectionId;
  @JsonKey(name: 'to_user')
  String? toUser;
  String? username;
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

  ConnectionsList({
    this.connectionId,
    this.toUser,
    this.username,
    this.toCard,
    this.businessName,
    this.businessDesignation,
    this.connectedDate,
    this.imageUrl,
    this.connectedViaQr,
  });

  factory ConnectionsList.fromJson(Map<String, dynamic> json) {
    return _$ConnectionsListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConnectionsListToJson(this);
}
