import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:realtime_employee/features/add_employee/const/add_employees_form_keys.dart';
import 'package:realtime_employee/l10n/l10n.dart';
import 'package:velocity_x/velocity_x.dart';

class EmployeeNameField extends StatelessWidget {
  const EmployeeNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: AddEmployeesFormKeys.name,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person_outline_outlined,
          color: context.primaryColor,
        ),
        hintText: context.l10n.employee_name_hint,
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
        errorText: context.l10n.employee_name_required_error,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
