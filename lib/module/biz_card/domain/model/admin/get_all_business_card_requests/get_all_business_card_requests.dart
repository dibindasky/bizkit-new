import 'package:json_annotation/json_annotation.dart';

import 'business_card_request.dart';

part 'get_all_business_card_requests.g.dart';

@JsonSerializable()
class GetAllBusinessCardRequests {
  int? count;
  dynamic next;
  dynamic previous;
  @JsonKey(name: 'results')
  List<BusinessCardRequest>? businesscardRequests;

  GetAllBusinessCardRequests({
    this.count,
    this.next,
    this.previous,
    this.businesscardRequests,
  });

  factory GetAllBusinessCardRequests.fromJson(Map<String, dynamic> json) {
    return _$GetAllBusinessCardRequestsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllBusinessCardRequestsToJson(this);
}
