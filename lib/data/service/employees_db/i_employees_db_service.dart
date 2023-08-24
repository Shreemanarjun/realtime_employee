import 'package:realtime_employee/data/model/employee_model.dart';

abstract class IEmployeesDbService {
  Employees getEmployees();
  Future<void> setEmployees(Employees employees);
}
