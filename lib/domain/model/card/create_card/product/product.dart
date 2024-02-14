import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class ProductCreate {
  bool? enquiry;
  String? label;
  String? description;
  dynamic product;

  ProductCreate({this.enquiry, this.label, this.description, this.product});

  factory ProductCreate.fromJson(Map<String, dynamic> json) {
    return _$ProductCreateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductCreateToJson(this);

  ProductCreate copyWith({
    bool? enquiry,
    String? label,
    String? description,
    dynamic product,
  }) {
    return ProductCreate(
      enquiry: enquiry ?? this.enquiry,
      label: label ?? this.label,
      description: description ?? this.description,
      product: product ?? this.product,
    );
  }
}
