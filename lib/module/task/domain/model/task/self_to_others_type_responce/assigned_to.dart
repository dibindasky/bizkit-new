import 'package:json_annotation/json_annotation.dart';

part 'assigned_to.g.dart';

@JsonSerializable()
class AssignedTo {
  String? user;
  @JsonKey(name: 'is_accepted')
  bool? isAccepted;

  AssignedTo({this.user, this.isAccepted});

  factory AssignedTo.fromJson(Map<String, dynamic> json) {
    return _$AssignedToFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AssignedToToJson(this);
}
