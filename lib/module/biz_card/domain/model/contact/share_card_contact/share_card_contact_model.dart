import 'package:json_annotation/json_annotation.dart';

import 'share_card_contact.dart';
part 'share_card_contact_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShareCardContactModel {
  String? cardId;
  List<ShareCardContact>? contacts;

  ShareCardContactModel({this.cardId, this.contacts});

  ShareCardContactModel copyWith({
    String? cardId,
    List<ShareCardContact>? contacts,
  }) {
    return ShareCardContactModel(
      cardId: cardId ?? this.cardId,
      contacts: contacts ?? this.contacts,
    );
  }

  factory ShareCardContactModel.fromJson(Map<String, dynamic> json) =>
      _$ShareCardContactModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShareCardContactModelToJson(this);
}
