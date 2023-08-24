import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:realtime_employee/bootstrap.dart';
import 'package:realtime_employee/core/router/router.gr.dart';
import 'package:realtime_employee/data/model/employee_model.dart';
import 'package:velocity_x/velocity_x.dart';

class EmployeesList extends StatefulWidget {
  final List<Employee> employees;
  final void Function(Employee employee) onDelete;
  const EmployeesList(
      {Key? key, required this.employees, required this.onDelete})
      : super(key: key);

  @override
  State<EmployeesList> createState() => _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  final ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: ListView.separated(
        shrinkWrap: true,
        controller: scrollController,
        itemCount: widget.employees.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final employee = widget.employees[index];
          talker.debug(employee.id);
          return Slidable(
            key: Key(employee.toString()),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(
                onDismissed: () {
                  widget.onDelete(employee);
                },
                confirmDismiss: () async {
                  return true;
                },
              ),
              dragDismissible: true,
              children: [
                SlidableAction(
                  flex: 2,
                  onPressed: (context) {
                    widget.onDelete(employee);
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete_outline_outlined,
                ),
              ],
            ),
            child: ListTile(
              isThreeLine: true,
              title: employee.name.text.medium.make(),
              subtitle: <Widget>[
                employee.role.text.make().py4(),
                if (employee.toDate != null)
                  "${DateFormat("dd MMM, yyyy").format(employee.fromDate)} - ${DateFormat("dd MMM, yyyy").format(employee.toDate!)}"
                      .text
                      .make()
                else
                  "From ${DateFormat("dd MMM, yyyy").format(employee.fromDate)}"
                      .text
                      .make()
              ].vStack(
                crossAlignment: CrossAxisAlignment.start,
                axisSize: MainAxisSize.min,
              ),
              onTap: () {
                context.navigateTo(EditEmployeeRoute(employee: employee));
              },
            ),
          );
        },
      ),
    );
  }
}
