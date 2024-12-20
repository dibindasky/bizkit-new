import 'package:json_annotation/json_annotation.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/shared_fields/shared_fields.dart';

part 'accept_or_reject_connection_request.g.dart';

@JsonSerializable()
class AcceptOrRejectConnectionRequest {
  @JsonKey(name: 'connection_id')
  String? connectionId;
  String? status;
  @JsonKey(name: 'shared_fields')
  SharedFields? sharedFields;

  AcceptOrRejectConnectionRequest({
    this.connectionId,
    this.status,
    this.sharedFields,
  });

  factory AcceptOrRejectConnectionRequest.fromJson(Map<String, dynamic> json) {
    return _$AcceptOrRejectConnectionRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (connectionId != null && connectionId!.isNotEmpty) {
      data['connection_id'] = connectionId;
    }
    if (status != null && status!.isNotEmpty) {
      data['status'] = status;
    }
    if (sharedFields != null) {
      data['shared_fields'] = sharedFields!.toJson();
    }

    return data;
  }
}
