import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realtime_employee/data/model/employee_model.dart';
import 'package:realtime_employee/data/service/employees_db/employees_db_pod.dart';
import 'package:velocity_x/velocity_x.dart';

class EmployeesNotifier extends AutoDisposeNotifier<Employees> {
  @override
  Employees build() {
    return ref.watch(employeesDBPod).getEmployees();
  }

  Future<void> addEmployee(Employee employee) async {
    final dbEmployees = ref.read(employeesDBPod).getEmployees();
    dbEmployees.employees.add(employee);
    await ref.read(employeesDBPod).setEmployees(dbEmployees);
    state = dbEmployees;
  }

  Future<void> deleteEmployee(String employeeID) async {
    final dbEmployees = ref.read(employeesDBPod).getEmployees().employees;
    dbEmployees.removeWhere(
      (element) => element.id == employeeID,
    );
    state = Employees(employees: [...dbEmployees]);
    await ref.read(employeesDBPod).setEmployees(state);
  }

  Future<void> updateEmployee(Employee employee) async {
    final dbEmployees = ref.read(employeesDBPod).getEmployees();
    final newemployee = dbEmployees.employees
        .replaceWhere((old) => old.id == employee.id, employee)
        .toList();
    state = Employees(employees: newemployee);
    await ref.read(employeesDBPod).setEmployees(state);
  }
}
