import 'package:json_annotation/json_annotation.dart';

part 'business_category_card.g.dart';

@JsonSerializable()
class BusinessCategoryCard {
  int? id;
  String? category;

  BusinessCategoryCard({this.id, this.category});

  factory BusinessCategoryCard.fromJson(Map<String, dynamic> json) {
    return _$BusinessCategoryCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessCategoryCardToJson(this);
}
