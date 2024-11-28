import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'bizcard_users_search_responce.g.dart';

@JsonSerializable()
class BizcardUsersSearchResponce {
  @JsonKey(name: 'data')
  List<BizCardUsers>? data;
  @JsonKey(name: 'has_more')
  bool? hasMore;
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'page_size')
  int? pageSize;

  BizcardUsersSearchResponce(
      {this.data, this.hasMore, this.currentPage, this.pageSize});

  factory BizcardUsersSearchResponce.fromJson(Map<String, dynamic> json) {
    return _$BizcardUsersSearchResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BizcardUsersSearchResponceToJson(this);
}
