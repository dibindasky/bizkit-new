import 'package:json_annotation/json_annotation.dart';

part 'connection_request_accept_or_reject_responce.g.dart';

@JsonSerializable()
class ConnectionRequestAcceptOrRejectResponce {
  String? message;
  @JsonKey(name: 'follow_back_possible')
  bool? followBackPossible;

  ConnectionRequestAcceptOrRejectResponce({
    this.message,
    this.followBackPossible,
  });

  factory ConnectionRequestAcceptOrRejectResponce.fromJson(
      Map<String, dynamic> json) {
    return _$ConnectionRequestAcceptOrRejectResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConnectionRequestAcceptOrRejectResponceToJson(this);
  }
}
