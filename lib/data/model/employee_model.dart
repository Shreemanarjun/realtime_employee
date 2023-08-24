import 'dart:convert';

import 'package:flutter/foundation.dart';

class Employees {
  final List<Employee> employees;
  Employees({
    required this.employees,
  });

  Employees copyWith({
    List<Employee>? employees,
  }) {
    return Employees(
      employees: employees ?? this.employees,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'employees': employees.map((x) => x.toMap()).toList(),
    };
  }

  factory Employees.fromMap(Map<String, dynamic> map) {
    return Employees(
      employees: List<Employee>.from(
          map['employees']?.map((x) => Employee.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory Employees.fromJson(String source) =>
      Employees.fromMap(json.decode(source));

  @override
  String toString() => 'Employees(employees: $employees)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Employees && listEquals(other.employees, employees);
  }

  @override
  int get hashCode => employees.hashCode;
}

class Employee {
  final String id;
  final String name;
  final String role;
  final DateTime fromDate;
  final DateTime? toDate;
  Employee({
    required this.id,
    required this.name,
    required this.role,
    required this.fromDate,
    this.toDate,
  });

  Employee copyWith({
    String? id,
    String? name,
    String? role,
    DateTime? fromDate,
    DateTime? toDate,
  }) {
    return Employee(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'fromDate': fromDate.millisecondsSinceEpoch,
      'toDate': toDate?.millisecondsSinceEpoch,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      role: map['role'] ?? '',
      fromDate: DateTime.fromMillisecondsSinceEpoch(map['fromDate']),
      toDate: map['toDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['toDate'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Employee(id: $id, name: $name, role: $role, fromDate: $fromDate, toDate: $toDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Employee &&
        other.id == id &&
        other.name == name &&
        other.role == role &&
        other.fromDate == fromDate &&
        other.toDate == toDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        role.hashCode ^
        fromDate.hashCode ^
        toDate.hashCode;
  }
}
