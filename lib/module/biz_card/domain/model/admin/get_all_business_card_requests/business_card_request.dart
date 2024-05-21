import 'package:json_annotation/json_annotation.dart';

part 'business_card_request.g.dart';

@JsonSerializable()
class BusinessCardRequest {
  int? id;
  String? name;
  String? designation;
  String? photo;
  @JsonKey(name: 'company_id')
  int? companyId;
  @JsonKey(name: 'card_id')
  int? cardId;
  @JsonKey(name: 'is_accepted')
  bool? isAccepted;
  @JsonKey(name: 'is_declined')
  bool? isDiclined;

  BusinessCardRequest({
    this.id,
    this.name,
    this.designation,
    this.photo,
    this.isAccepted,
    this.isDiclined,
    this.companyId,
    this.cardId,
  });

  factory BusinessCardRequest.fromJson(Map<String, dynamic> json) {
    return _$BusinessCardRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessCardRequestToJson(this);
}
