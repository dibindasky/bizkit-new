import 'package:json_annotation/json_annotation.dart';

part 'connection.g.dart';

@JsonSerializable()
class MyConnection {
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
  DateTime? connectedDate;
  @JsonKey(name: 'image_url')
  dynamic imageUrl;

  MyConnection({
    this.connectionId,
    this.toUser,
    this.username,
    this.toCard,
    this.businessName,
    this.businessDesignation,
    this.connectedDate,
    this.imageUrl,
  });

  factory MyConnection.fromJson(Map<String, dynamic> json) {
    return _$ConnectionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConnectionToJson(this);
}
