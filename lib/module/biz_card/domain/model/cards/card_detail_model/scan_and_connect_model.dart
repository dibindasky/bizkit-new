import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';

class ScanAndConnectModel {
  CardDetailModel? sharedDetails;
  bool? newConnection;
  String? connectionId;

  ScanAndConnectModel(
      {this.newConnection, this.sharedDetails, this.connectionId});

  // From JSON
  factory ScanAndConnectModel.fromJson(Map<String, dynamic> json) {
    return ScanAndConnectModel(
      newConnection: json['new_connection'] as bool?,
      connectionId: json['connection_id'] as String?,
      sharedDetails: json['shared_details'] != null
          ? CardDetailModel.fromJson(json['shared_details'],
              connectionId: json["connection_id"] as String?)
          : null,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'new_connection': newConnection,
      'connection_id': connectionId,
      'shared_details': sharedDetails?.toJson(),
    };
  }
}
