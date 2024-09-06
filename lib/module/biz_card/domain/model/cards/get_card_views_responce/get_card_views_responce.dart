import 'package:json_annotation/json_annotation.dart';

import 'view.dart';

part 'get_card_views_responce.g.dart';

@JsonSerializable()
class GetCardViewsResponce {
  List<Views>? views;

  GetCardViewsResponce({this.views});

  factory GetCardViewsResponce.fromJson(Map<String, dynamic> json) {
    return _$GetCardViewsResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCardViewsResponceToJson(this);
}
