import 'package:json_annotation/json_annotation.dart';

import '../card/card.dart';

part 'get_card_resposnse_model.g.dart';

@JsonSerializable()
class GetCardResposnseModel {
  int? count;
  String? next;
  String? previous;
  List<Card>? results;

  GetCardResposnseModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory GetCardResposnseModel.fromJson(Map<String, dynamic> json) {
    return _$GetCardResposnseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCardResposnseModelToJson(this);
}
