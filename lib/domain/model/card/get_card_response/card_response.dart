import 'package:json_annotation/json_annotation.dart';

part 'card_response.g.dart';

@JsonSerializable()
class CardResponse {
  int? id;
  @JsonKey(name: 'qr_url')
  String? qrUrl;
  String? photo;
  String? logo;
  @JsonKey(name: 'is_default')
  bool? isDefault;
  @JsonKey(name: 'is_archived')
  bool? isArchived;
  int? user;
  @JsonKey(name: 'personal_details')
  int? personalDetails;
  @JsonKey(name: 'business_details')
  int? businessDetails;
  @JsonKey(name: 'bank_details')
  int? bankDetails;

  CardResponse({
    this.id,
    this.qrUrl,
    this.photo,
    this.logo,
    this.isDefault,
    this.isArchived,
    this.user,
    this.personalDetails,
    this.businessDetails,
    this.bankDetails,
  });

  factory CardResponse.fromJson(Map<String, dynamic> json) {
    return _$CardResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardResponseToJson(this);
}
