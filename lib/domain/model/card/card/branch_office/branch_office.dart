import 'package:json_annotation/json_annotation.dart';

part 'branch_office.g.dart';

@JsonSerializable()
class BranchOffice {
  int? id;
  String? branch;
  @JsonKey(name: 'card_id')
  int? cardId;

  BranchOffice({this.id, this.branch, this.cardId});

  factory BranchOffice.fromJson(Map<String, dynamic> json) {
    return _$BranchOfficeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BranchOfficeToJson(this);
}
