import 'package:realtime_employee/core/local_storage/app_storage.dart';
import 'package:realtime_employee/data/model/employee_model.dart';

import 'i_employees_db_service.dart';

class EmployeesDbService implements IEmployeesDbService {
  final AppStorage appStorage;

  EmployeesDbService({required this.appStorage});

  final _employeesKey = 'employees';
  @override
  Employees getEmployees() {
    final employeesJson = appStorage.get(key: _employeesKey);
    if (employeesJson != null) {
      return Employees.fromJson(employeesJson);
    } else {
      return Employees(employees: []);
    }
  }

  @override
  Future<void> setEmployees(Employees employees) async {
    await appStorage.put(key: _employeesKey, value: employees.toJson());
  }
}
