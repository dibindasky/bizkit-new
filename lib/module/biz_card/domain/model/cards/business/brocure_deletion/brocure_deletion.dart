import 'package:json_annotation/json_annotation.dart';

part 'brocure_deletion.g.dart';

@JsonSerializable()
class BrocureDeletion {
  @JsonKey(name: 'business_details_id')
  String? businessDetailsId;
  @JsonKey(name: 'brochure_id')
  String? brochureId;

  BrocureDeletion({this.businessDetailsId, this.brochureId});

  factory BrocureDeletion.fromJson(Map<String, dynamic> json) {
    return _$BrocureDeletionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BrocureDeletionToJson(this);
}
