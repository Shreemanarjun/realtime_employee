import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realtime_employee/core/local_storage/app_storage_pod.dart';
import 'package:realtime_employee/data/service/employees_db/employees_db_service.dart';

final employeesDBPod = Provider.autoDispose<EmployeesDbService>((ref) {
  return EmployeesDbService(
    appStorage: ref.watch(appStorageProvider),
  );
});
