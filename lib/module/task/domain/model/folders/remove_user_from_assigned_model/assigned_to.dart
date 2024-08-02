import 'package:json_annotation/json_annotation.dart';

part 'assigned_to.g.dart';

@JsonSerializable()
class AssignedTo {
  String? user;

  AssignedTo({this.user});

  factory AssignedTo.fromJson(Map<String, dynamic> json) {
    return _$AssignedToFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AssignedToToJson(this);
}
