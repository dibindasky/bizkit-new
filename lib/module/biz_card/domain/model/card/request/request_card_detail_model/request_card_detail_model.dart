import 'package:json_annotation/json_annotation.dart';

part 'request_card_detail_model.g.dart';

@JsonSerializable()
class RequestCardDetailModel {
  @JsonKey(name: 'company_id')
  int? companyId;
  @JsonKey(name: 'card_id')
  int? cardId;

  RequestCardDetailModel({this.companyId, this.cardId});

  factory RequestCardDetailModel.fromJson(Map<String, dynamic> json) {
    return _$RequestCardDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RequestCardDetailModelToJson(this);
}
