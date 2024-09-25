import 'package:json_annotation/json_annotation.dart';

part 'shared_card_model.g.dart';

@JsonSerializable()
class SharedCardModel {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'shared_card_id')
  String? sharedCardId;
  @JsonKey(name: 'shared_by')
  String? sharedBy;
  @JsonKey(name: 'shared_by_name')
  String? sharedByName;
  @JsonKey(name: 'shared_by_email')
  String? sharedByEmail;
  @JsonKey(name: 'shared_by_profile_picture')
  String? sharedByProfilePicture;
  @JsonKey(name: 'shared_at')
  String? sharedAt;
  String? status;

  SharedCardModel({
    this.id,
    this.sharedCardId,
    this.sharedBy,
    this.sharedByName,
    this.sharedByEmail,
    this.sharedByProfilePicture,
    this.sharedAt,
    this.status,
  });

  // From JSON
  factory SharedCardModel.fromJson(Map<String, dynamic> json) =>
      _$SharedCardModelFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$SharedCardModelToJson(this);
}
