import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'get_profile_details_responce_model.g.dart';

@JsonSerializable()
class GetProfileDetailsResponceModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  GetProfileDetailsResponceModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory GetProfileDetailsResponceModel.fromJson(Map<String, dynamic> json) {
    return _$GetProfileDetailsResponceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetProfileDetailsResponceModelToJson(this);
  }
}
