import 'package:json_annotation/json_annotation.dart';

import 'company.dart';

part 'get_companys.g.dart';

@JsonSerializable()
class GetCompanysResponseModel {
  List<Company>? companies;

  GetCompanysResponseModel({this.companies});

  factory GetCompanysResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetCompanysResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCompanysResponseModelToJson(this);
}
