import 'package:json_annotation/json_annotation.dart';

part 'success_response_model.g.dart';

@JsonSerializable()
class SuccessResponseModel {
  String? message;
  dynamic data;

  SuccessResponseModel({this.message, this.data});

  factory SuccessResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SuccessResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SuccessResponseModelToJson(this);
}
