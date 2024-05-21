import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'get_request_list_responsemodel.g.dart';

@JsonSerializable()
class GetRequestListResponsemodel {
  int? count;
  dynamic next;
  dynamic previous;
  List<RequestModel>? results;

  GetRequestListResponsemodel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory GetRequestListResponsemodel.fromJson(Map<String, dynamic> json) {
    return _$GetRequestListResponsemodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetRequestListResponsemodelToJson(this);
}
