import 'package:bizkit/module/biz_card/domain/model/card_second/get_second_card_model/selfie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_selfie_model.g.dart';

@JsonSerializable()
class AddSelfieModel {
  @JsonKey(name: 'business_card_id')
  int? businessCardId;
  List<Selfie>? selfie;

  AddSelfieModel({this.businessCardId, this.selfie});

  factory AddSelfieModel.fromJson(Map<String, dynamic> json) {
    return _$AddSelfieModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddSelfieModelToJson(this);
}
