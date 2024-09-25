import 'package:bizkit/module/biz_card/domain/model/connections/shared_cards/shared_card_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shared_cards_response.g.dart';

@JsonSerializable()
class SharedCardsResponseModel {
  @JsonKey(name: 'shared_cards')
  List<SharedCardModel>? results;

  SharedCardsResponseModel({this.results});

  factory SharedCardsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SharedCardsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SharedCardsResponseModelToJson(this);
}
