import 'package:json_annotation/json_annotation.dart';

import 'archeived_card.dart';

part 'archeived_card_model.g.dart';

@JsonSerializable()
class ArcheivedCardModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<ArcheivedCard>? results;

  ArcheivedCardModel({this.count, this.next, this.previous, this.results});

  factory ArcheivedCardModel.fromJson(Map<String, dynamic> json) {
    return _$ArcheivedCardModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArcheivedCardModelToJson(this);
}
