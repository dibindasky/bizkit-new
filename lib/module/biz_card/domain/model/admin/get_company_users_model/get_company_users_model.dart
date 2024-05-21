import 'package:json_annotation/json_annotation.dart';

import 'company_users.dart';

part 'get_company_users_model.g.dart';

@JsonSerializable()
class GetCompanyUsersModel {
  int? count;
  dynamic next;
  dynamic previous;
  @JsonKey(name: 'results')
  List<CompanyUsers>? companyUsers;

  GetCompanyUsersModel({
    this.count,
    this.next,
    this.previous,
    this.companyUsers,
  });

  factory GetCompanyUsersModel.fromJson(Map<String, dynamic> json) {
    return _$GetCompanyUsersModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCompanyUsersModelToJson(this);
}
