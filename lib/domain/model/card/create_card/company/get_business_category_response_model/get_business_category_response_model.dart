import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'get_business_category_response_model.g.dart';

@JsonSerializable()
class GetBusinessCategoryResponseModel {
  @JsonKey(name: 'categories')
  List<Category>? businessCategories;

  GetBusinessCategoryResponseModel({this.businessCategories});

  factory GetBusinessCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetBusinessCategoryResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetBusinessCategoryResponseModelToJson(this);
  }
}
