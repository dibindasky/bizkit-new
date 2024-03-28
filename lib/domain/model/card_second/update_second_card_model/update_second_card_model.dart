import 'package:json_annotation/json_annotation.dart';

part 'update_second_card_model.g.dart';

@JsonSerializable()
class UpdateSecondCardModel {
  String? name;
  String? company;
  String? selfie;

  UpdateSecondCardModel({this.name, this.company, this.selfie});

  factory UpdateSecondCardModel.fromJson(Map<String, dynamic> json) {
    return _$UpdateSecondCardModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateSecondCardModelToJson(this);
}
