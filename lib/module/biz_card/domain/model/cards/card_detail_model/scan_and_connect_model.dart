import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';

class ScanAndConnectModel {
  CardDetailModel? sharedDetails;
  bool? newConnection;

  ScanAndConnectModel({this.newConnection, this.sharedDetails});

  // From JSON
  factory ScanAndConnectModel.fromJson(Map<String, dynamic> json) {
    return ScanAndConnectModel(
      newConnection: json['new_connection'] as bool?,
      sharedDetails: json['shared_details'] != null
          ? CardDetailModel.fromJson(json['shared_details'])
          : null,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'new_connection': newConnection,
      'shared_details': sharedDetails?.toJson(),
    };
  }
}
