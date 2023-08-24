import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realtime_employee/data/model/employee_model.dart';
import 'package:realtime_employee/features/employees/controller/notifier/employees_notifier.dart';

final employeesPod = NotifierProvider.autoDispose<EmployeesNotifier, Employees>(
  EmployeesNotifier.new,
  name: 'employeesPod',
);
