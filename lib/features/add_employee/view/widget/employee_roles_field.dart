import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:realtime_employee/features/add_employee/const/add_employees_form_keys.dart';
import 'package:realtime_employee/l10n/l10n.dart';
import 'package:velocity_x/velocity_x.dart';

class EmployeeRolesField extends StatelessWidget {
  const EmployeeRolesField({
    Key? key,
    required this.onRoleTap,
  }) : super(key: key);
  final VoidCallback onRoleTap;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: AddEmployeesFormKeys.role,
      readOnly: true,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.work_outline,
          color: context.primaryColor,
        ),
        suffixIcon: Icon(
          Icons.arrow_drop_down,
          color: context.primaryColor,
          size: 32,
        ),
        hintText: context.l10n.employee_select_role,
        hintStyle: const TextStyle(color: Color.fromRGBO(148, 156, 158, 1)),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(229, 229, 229, 1),
            width: 1,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      keyboardType: TextInputType.name,
      validator: FormBuilderValidators.required(
          errorText: context.l10n.employee_select_role_required_error),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: onRoleTap,
    );
  }
}
