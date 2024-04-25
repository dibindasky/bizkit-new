import 'package:json_annotation/json_annotation.dart';

import 'seond_card_new.dart';

part 'get_all_second_card_model.g.dart';

@JsonSerializable()
class GetAllSecondCardModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<SecondCardNew>? results;

  GetAllSecondCardModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory GetAllSecondCardModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllSecondCardModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllSecondCardModelToJson(this);
}
