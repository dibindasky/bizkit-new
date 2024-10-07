import 'package:json_annotation/json_annotation.dart';

import 'task.dart';

part 'self_to_others_type_responce.g.dart';

@JsonSerializable()
class SelfToOthersTypeResponce {
  @JsonKey(name: 'data')
  List<Task>? data;
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'page_size')
  int? pageSize;
  @JsonKey(name: 'has_more')
  bool? hasMore;

  SelfToOthersTypeResponce(
      {this.data, this.currentPage, this.hasMore, this.pageSize});

  factory SelfToOthersTypeResponce.fromJson(Map<String, dynamic> json) {
    return _$SelfToOthersTypeResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SelfToOthersTypeResponceToJson(this);
}
