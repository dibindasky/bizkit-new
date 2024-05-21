import 'package:json_annotation/json_annotation.dart';

import 'user_view.dart';

part 'get_views_response_model.g.dart';

@JsonSerializable()
class GetViewsResponseModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<UserView>? results;

  GetViewsResponseModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory GetViewsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetViewsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetViewsResponseModelToJson(this);
}
