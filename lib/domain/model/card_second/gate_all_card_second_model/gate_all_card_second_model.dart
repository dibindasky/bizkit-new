import 'package:json_annotation/json_annotation.dart';

import 'second_card.dart';

part 'gate_all_card_second_model.g.dart';

@JsonSerializable()
class GateAllCardSecondModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<SecondCard>? results;

  GateAllCardSecondModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory GateAllCardSecondModel.fromJson(Map<String, dynamic> json) {
    return _$GateAllCardSecondModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GateAllCardSecondModelToJson(this);
}
