import 'package:json_annotation/json_annotation.dart';

part 'scanned_image_datas_model.g.dart';

@JsonSerializable()
class ScannedImageDatasModel {
  List<String>? phone;
  List<String>? emails;
  List<String>? websites;
  List<String>? names;
  List<String>? unKnown;

  ScannedImageDatasModel({
    this.phone,
    this.emails,
    this.websites,
    this.names,
    this.unKnown,
  });

  factory ScannedImageDatasModel.fromJson(Map<String, dynamic> json) {
    return _$ScannedImageDatasModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ScannedImageDatasModelToJson(this);
}
