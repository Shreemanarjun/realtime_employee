// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:realtime_employee/data/model/employee_model.dart' as _i8;
import 'package:realtime_employee/features/add_employee/view/add_employee_details_page.dart'
    deferred as _i1;
import 'package:realtime_employee/features/counter/view/counter_page.dart'
    deferred as _i2;
import 'package:realtime_employee/features/edit_employee/view/edit_employee_page.dart'
    deferred as _i3;
import 'package:realtime_employee/features/employee_roles_bottom_sheet/employee_roles_bottom_sheet_page.dart'
    deferred as _i4;
import 'package:realtime_employee/features/employees/view/employees_page.dart'
    deferred as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AddEmployeeDetailsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.AddEmployeeDetailsPage(),
        ),
      );
    },
    CounterRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.CounterPage(),
        ),
      );
    },
    EditEmployeeRoute.name: (routeData) {
      final args = routeData.argsAs<EditEmployeeRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.EditEmployeePage(
            key: args.key,
            employee: args.employee,
          ),
        ),
      );
    },
    EmployeeRolesBottomSheetRoute.name: (routeData) {
      final args = routeData.argsAs<EmployeeRolesBottomSheetRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.EmployeeRolesBottomSheetPage(
            key: args.key,
            onRoleSelected: args.onRoleSelected,
          ),
        ),
      );
    },
    EmployeesRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.EmployeesPage(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddEmployeeDetailsPage]
class AddEmployeeDetailsRoute extends _i6.PageRouteInfo<void> {
  const AddEmployeeDetailsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AddEmployeeDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddEmployeeDetailsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CounterPage]
class CounterRoute extends _i6.PageRouteInfo<void> {
  const CounterRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EditEmployeePage]
class EditEmployeeRoute extends _i6.PageRouteInfo<EditEmployeeRouteArgs> {
  EditEmployeeRoute({
    _i7.Key? key,
    required _i8.Employee employee,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          EditEmployeeRoute.name,
          args: EditEmployeeRouteArgs(
            key: key,
            employee: employee,
          ),
          initialChildren: children,
        );

  static const String name = 'EditEmployeeRoute';

  static const _i6.PageInfo<EditEmployeeRouteArgs> page =
      _i6.PageInfo<EditEmployeeRouteArgs>(name);
}

class EditEmployeeRouteArgs {
  const EditEmployeeRouteArgs({
    this.key,
    required this.employee,
  });

  final _i7.Key? key;

  final _i8.Employee employee;

  @override
  String toString() {
    return 'EditEmployeeRouteArgs{key: $key, employee: $employee}';
  }
}

/// generated route for
/// [_i4.EmployeeRolesBottomSheetPage]
class EmployeeRolesBottomSheetRoute
    extends _i6.PageRouteInfo<EmployeeRolesBottomSheetRouteArgs> {
  EmployeeRolesBottomSheetRoute({
    _i7.Key? key,
    required void Function(String) onRoleSelected,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          EmployeeRolesBottomSheetRoute.name,
          args: EmployeeRolesBottomSheetRouteArgs(
            key: key,
            onRoleSelected: onRoleSelected,
          ),
          initialChildren: children,
        );

  static const String name = 'EmployeeRolesBottomSheetRoute';

  static const _i6.PageInfo<EmployeeRolesBottomSheetRouteArgs> page =
      _i6.PageInfo<EmployeeRolesBottomSheetRouteArgs>(name);
}

class EmployeeRolesBottomSheetRouteArgs {
  const EmployeeRolesBottomSheetRouteArgs({
    this.key,
    required this.onRoleSelected,
  });

  final _i7.Key? key;

  final void Function(String) onRoleSelected;

  @override
  String toString() {
    return 'EmployeeRolesBottomSheetRouteArgs{key: $key, onRoleSelected: $onRoleSelected}';
  }
}

/// generated route for
/// [_i5.EmployeesPage]
class EmployeesRoute extends _i6.PageRouteInfo<void> {
  const EmployeesRoute({List<_i6.PageRouteInfo>? children})
      : super(
          EmployeesRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmployeesRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
