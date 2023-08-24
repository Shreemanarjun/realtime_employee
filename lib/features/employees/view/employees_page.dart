import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realtime_employee/const/resource.dart';
import 'package:realtime_employee/core/router/router.gr.dart';
import 'package:realtime_employee/data/model/employee_model.dart';
import 'package:realtime_employee/features/employees/controller/current_employees_pod.dart';
import 'package:realtime_employee/features/employees/controller/employees_pod.dart';
import 'package:realtime_employee/features/employees/controller/previous_employees_pod.dart';
import 'package:realtime_employee/features/employees/view/widget/employees_list.dart';
import 'package:realtime_employee/features/employees/view/widget/employees_type_header.dart';
import 'package:realtime_employee/l10n/l10n.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(
  deferredLoading: true,
)
class EmployeesPage extends ConsumerStatefulWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends ConsumerState<EmployeesPage> {
  void onDeleteEmployee(Employee employee) async {
    await ref.read(employeesPod.notifier).deleteEmployee(employee.id);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          action: SnackBarAction(
            label: "Undo",
            onPressed: () async {
              ScaffoldMessenger.of(context).clearSnackBars();
              await ref.read(employeesPod.notifier).addEmployee(employee);
            },
          ),
          content: "Employee data has been deleted".text.isIntrinsic.make(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: context.l10n.employees_list_title.text.make(),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          context.navigateTo(const AddEmployeeDetailsRoute());
        },
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final employees = ref.watch(employeesPod);
          return employees.employees.isEmpty
              ? FractionallySizedBox(
                  heightFactor: 0.9,
                  child: <Widget>[
                    Image.asset(
                      R.ASSETS_IMAGES_NO_EMPLOYEE_PNG,
                    )
                        .pOnly(
                          top: 8,
                        )
                        .pSymmetric(h: 80),
                    "No employee records found".text.lg.semiBold.make()
                  ]
                      .vStack(
                        axisSize: MainAxisSize.min,
                      )
                      .centered(),
                )
              : <Widget>[
                  const EmployeesTypeHeader(
                    text: 'Current employees',
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final currentEmployees = ref.watch(currentEmployeesPod);
                      return EmployeesList(
                        employees: currentEmployees.employees,
                        onDelete: onDeleteEmployee,
                      );
                    },
                  ).expand(),
                  const EmployeesTypeHeader(
                    text: 'Previous employees',
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final previosuEmployees = ref.watch(previousEmployeesPod);
                      return EmployeesList(
                        employees: previosuEmployees.employees,
                        onDelete: onDeleteEmployee,
                      );
                    },
                  ).expand(),
                  'Swipe left to delete'
                      .text
                      .semiBold
                      .color(
                        const Color(0xFF949C9E),
                      )
                      .heightRelaxed
                      .make()
                      .p16()
                      .pOnly(
                        bottom: context.screenPadding.bottom,
                      )
                      .box
                      .gray100
                      .make(),
                ].vStack(
                  crossAlignment: CrossAxisAlignment.stretch,
                );
        },
      ).safeArea(),
    );
  }
}
