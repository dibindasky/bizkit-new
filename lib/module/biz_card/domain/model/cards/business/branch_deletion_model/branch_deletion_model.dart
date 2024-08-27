import 'package:json_annotation/json_annotation.dart';

part 'branch_deletion_model.g.dart';

@JsonSerializable()
class BranchDeletionModel {
  @JsonKey(name: 'business_details_id')
  String? businessDetailsId;
  @JsonKey(name: 'branch_office_id')
  String? branchOfficeId;

  BranchDeletionModel({this.businessDetailsId, this.branchOfficeId});

  factory BranchDeletionModel.fromJson(Map<String, dynamic> json) {
    return _$BranchDeletionModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BranchDeletionModelToJson(this);
}
