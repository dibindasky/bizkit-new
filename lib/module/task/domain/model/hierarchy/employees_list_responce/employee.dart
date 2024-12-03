import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee {
  String? name;
  String? email;
  @JsonKey(name: 'profile_picture')
  dynamic profilePicture;
  @JsonKey(name: 'emp_id')
  String? empId;
  String? designation;
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: '_id')
  String? id;

  Employee({
    this.name,
    this.email,
    this.profilePicture,
    this.empId,
    this.designation,
    this.userId,
    this.id,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return _$EmployeeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
