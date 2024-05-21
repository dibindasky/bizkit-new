import 'package:json_annotation/json_annotation.dart';
import 'qr_model.dart';
part 'get_qr_code_response_model.g.dart';

@JsonSerializable()
class GetQrCodeResponseModel {
  int? count;
  String? next;
  String? previous;
  List<QRModel>? results;

  GetQrCodeResponseModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory GetQrCodeResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetQrCodeResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetQrCodeResponseModelToJson(this);
}
