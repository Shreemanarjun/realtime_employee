import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realtime_employee/const/custom_button_styles.dart';
import 'package:realtime_employee/core/router/router.gr.dart';
import 'package:realtime_employee/core/router/router_pod.dart';
import 'package:realtime_employee/data/model/employee_model.dart';
import 'package:realtime_employee/features/add_employee/const/add_employees_form_keys.dart';
import 'package:realtime_employee/features/add_employee/view/widget/employee_form_date_field.dart';
import 'package:realtime_employee/features/add_employee/view/widget/employee_name_field.dart';
import 'package:realtime_employee/features/add_employee/view/widget/employee_roles_field.dart';
import 'package:realtime_employee/features/add_employee/view/widget/employee_to_date_field.dart';
import 'package:realtime_employee/features/employees/controller/employees_pod.dart';
import 'package:realtime_employee/l10n/l10n.dart';
import 'package:uuid/uuid.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(
  deferredLoading: true,
)
class AddEmployeeDetailsPage extends ConsumerStatefulWidget {
  const AddEmployeeDetailsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AddEmployeeDetailsPage> createState() =>
      _AddEmployeeDetailsPageState();
}

class _AddEmployeeDetailsPageState
    extends ConsumerState<AddEmployeeDetailsPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  void onRoleFieldTap() {
    context.navigateTo(EmployeeRolesBottomSheetRoute(
      onRoleSelected: (String role) {
        context.back();
        _formKey.currentState?.fields[AddEmployeesFormKeys.role]
            ?.didChange(role);
      },
    ));
  }

  void cancel() {
    context.router.pop();
  }

  void saveEmployee() async {
    if (_formKey.currentState?.validate() ?? false) {
      final fields = _formKey.currentState?.fields;
      final name = fields?[AddEmployeesFormKeys.name]?.value as String;
      final role = fields?[AddEmployeesFormKeys.role]?.value as String;
      final from = fields?[AddEmployeesFormKeys.fromDate]?.value as DateTime;
      final to = fields?[AddEmployeesFormKeys.toDate]?.value as DateTime?;
      await ref.read(employeesPod.notifier).addEmployee(
            Employee(
              id: const Uuid().v4(),
              name: name,
              role: role,
              fromDate: from,
              toDate: to,
            ),
          );
      ref.read(autorouterProvider).pop();
    }
  }

  void onFormDateChange() async {
    _formKey.currentState?.saveAndValidate();
    setState(() {});
    final fields = _formKey.currentState?.fields;
    final to = fields?[AddEmployeesFormKeys.toDate]?.value as DateTime?;
    final from = fields?[AddEmployeesFormKeys.fromDate]?.value as DateTime;
    if (to != null && to.isBefore(from)) {
      fields?[AddEmployeesFormKeys.toDate]?.reset();
    }
  }

  void onToDateChange() async {
    _formKey.currentState?.saveAndValidate();
    setState(() {});
    final fields = _formKey.currentState?.fields;
    final to = fields?[AddEmployeesFormKeys.toDate]?.value as DateTime?;
    final from = fields?[AddEmployeesFormKeys.fromDate]?.value as DateTime;
    if (to != null && to.isBefore(from)) {
      fields?[AddEmployeesFormKeys.toDate]?.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: context.l10n.add_employee_details_title.text.make(),
        elevation: 0,
      ),
      body: FormBuilder(
        key: _formKey,
        child: <Widget>[
          const EmployeeNameField(),
          EmployeeRolesField(
            onRoleTap: onRoleFieldTap,
          ).pOnly(top: 12),
          <Widget>[
            Expanded(
              child: EmployeeFormDateField(
                onDateChange: onFormDateChange,
              ).h48(context),
            ),
            Icon(
              Icons.arrow_right_alt,
              color: context.primaryColor,
            ).pOnly(top: 12),
            Expanded(
              child: EmployeeToDateField(
                intialDate: _formKey
                    .currentState?.fields[AddEmployeesFormKeys.fromDate]?.value,
                onDateChange: onToDateChange,
              ).h48(context),
            )
          ]
              .hStack(
                alignment: MainAxisAlignment.center,
                crossAlignment: CrossAxisAlignment.start,
              )
              .pOnly(top: 12),
        ].vStack(crossAlignment: CrossAxisAlignment.stretch).p16(),
      ).scrollVertical().safeArea(),
      floatingActionButton: <Widget>[
        const Divider(height: 2),
        <Widget>[
          OutlinedButton(
            style: CustomButtonStyles.unselectedBtnStyle(context),
            onPressed: cancel,
            child: "Cancel".text.isIntrinsic.make(),
          ).pOnly(right: 16).flexible(),
          OutlinedButton(
            style: CustomButtonStyles.selectedBtnStyle(context),
            onPressed: saveEmployee,
            child: "Save".text.isIntrinsic.make(),
          ).flexible()
        ]
            .hStack(
              alignment: MainAxisAlignment.end,
            )
            .pOnly(right: 16)
            .flexible(),
      ].vStack(axisSize: MainAxisSize.min).safeArea(),
    );
  }
}
