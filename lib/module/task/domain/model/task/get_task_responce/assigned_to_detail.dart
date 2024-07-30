import 'package:json_annotation/json_annotation.dart';

part 'assigned_to_detail.g.dart';

@JsonSerializable()
class AssignedToDetail {
  @JsonKey(name: 'user_id')
  String? userId;
  String? name;
  @JsonKey(name: 'is_accepted')
  String? isAccepted;

  AssignedToDetail({this.userId, this.name, this.isAccepted});

  factory AssignedToDetail.fromJson(Map<String, dynamic> json) {
    return _$AssignedToDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AssignedToDetailToJson(this);
}
