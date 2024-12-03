import 'package:json_annotation/json_annotation.dart';

import 'employee.dart';

part 'employees_list_responce.g.dart';

@JsonSerializable()
class EmployeesListResponce {
  @JsonKey(name: 'employees')
  List<Employee>? employees;
  @JsonKey(name: 'has_more')
  bool? hasMore;
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'page_size')
  int? pageSize;

  EmployeesListResponce({
    this.employees,
    this.hasMore,
    this.page,
    this.pageSize,
  });

  factory EmployeesListResponce.fromJson(Map<String, dynamic> json) {
    return _$EmployeesListResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmployeesListResponceToJson(this);
}
