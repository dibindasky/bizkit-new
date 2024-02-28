import 'package:json_annotation/json_annotation.dart';

part 'branch_offices.g.dart';

@JsonSerializable()
class BranchOffices {
  int? id;
  String? branch;

  BranchOffices({this.id, this.branch});

  factory BranchOffices.fromJson(Map<String, dynamic> json) {
    return _$BranchOfficesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BranchOfficesToJson(this);
}
