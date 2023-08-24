import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realtime_employee/data/model/employee_model.dart';
import 'package:realtime_employee/features/employees/controller/employees_pod.dart';
import 'package:velocity_x/velocity_x.dart';

final previousEmployeesPod = Provider.autoDispose<Employees>(
  (ref) {
    return Employees(
      employees: ref
          .watch(employeesPod.select((value) =>
              value.employees.filter((element) => element.toDate != null)))
          .toList(),
    );
  },
  name: 'previousEmployeesPod',
);
