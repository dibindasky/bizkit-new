import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'received_quick_task_requests.g.dart';

@JsonSerializable()
class ReceivedQuickTaskRequests {
  List<QuickTaskRequests>? data;
  @JsonKey(name: 'page_size')
  int? pageSize;
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'has_more')
  bool? hasMore;

  ReceivedQuickTaskRequests({
    this.data,
    this.pageSize,
    this.currentPage,
    this.hasMore,
  });

  factory ReceivedQuickTaskRequests.fromJson(Map<String, dynamic> json) {
    return _$ReceivedQuickTaskRequestsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReceivedQuickTaskRequestsToJson(this);
}
