import 'package:json_annotation/json_annotation.dart';

part 'product_deletion.g.dart';

@JsonSerializable()
class ProductDeletion {
  @JsonKey(name: 'business_details_id')
  String? businessDetailsId;
  @JsonKey(name: 'product_id')
  String? productId;

  ProductDeletion({this.businessDetailsId, this.productId});

  factory ProductDeletion.fromJson(Map<String, dynamic> json) {
    return _$ProductDeletionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductDeletionToJson(this);
}
