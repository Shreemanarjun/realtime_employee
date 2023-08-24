import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:realtime_employee/core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: EmployeesRoute.page,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: AddEmployeeDetailsRoute.page,
      path: '/addEmployee',
    ),
    AutoRoute(
      page: EditEmployeeRoute.page,
      path: '/editEmployee',
    ),
    CustomRoute(
      page: EmployeeRolesBottomSheetRoute.page,
      path: '/employeesRoles',
      customRouteBuilder:
          <T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
        return ModalBottomSheetRoute(
          // this is important
          settings: page,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          isScrollControlled: true,
          builder: (_) => child,
        );
      },
    ),
  ];
}
