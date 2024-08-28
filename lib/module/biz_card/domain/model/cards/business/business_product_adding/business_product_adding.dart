import 'package:json_annotation/json_annotation.dart';

part 'business_product_adding.g.dart';

@JsonSerializable()
class BusinessProductAdding {
  String? title;
  String? description;
  List<String>? images;
  bool? enquiry;
  @JsonKey(name: 'business_details_id')
  String? businessDetailsId;
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'product_id')
  String? productId;

  BusinessProductAdding({
    this.title,
    this.description,
    this.images,
    this.productId,
    this.enquiry,
    this.businessDetailsId,
    this.bizcardId,
  });

  factory BusinessProductAdding.fromJson(Map<String, dynamic> json) {
    return _$BusinessProductAddingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessProductAddingToJson(this);
}
