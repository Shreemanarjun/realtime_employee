import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:realtime_employee/features/add_employee/const/add_employees_form_keys.dart';
import 'package:realtime_employee/shared/widget/custom_date_field.dart';

class EmployeeFormDateField extends StatelessWidget {
  final VoidCallback? onDateChange;
  const EmployeeFormDateField({Key? key, this.onDateChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDateField(
      name: AddEmployeesFormKeys.fromDate,
      validator: FormBuilderValidators.required(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onDateChange: onDateChange,
    );
  }
}
