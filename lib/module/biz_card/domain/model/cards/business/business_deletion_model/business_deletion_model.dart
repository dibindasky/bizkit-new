import 'package:json_annotation/json_annotation.dart';

part 'business_deletion_model.g.dart';

@JsonSerializable()
class BusinessDeletionModel {
  @JsonKey(name: 'social_media_id')
  String? socialMediaId;
  @JsonKey(name: 'business_details_id')
  String? businessDetailsId;

  BusinessDeletionModel({this.socialMediaId, this.businessDetailsId});

  factory BusinessDeletionModel.fromJson(Map<String, dynamic> json) {
    return _$BusinessDeletionModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessDeletionModelToJson(this);
}
