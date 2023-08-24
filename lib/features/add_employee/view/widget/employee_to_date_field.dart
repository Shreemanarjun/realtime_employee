import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:realtime_employee/features/add_employee/const/add_employees_form_keys.dart';
import 'package:realtime_employee/shared/widget/custom_date_field.dart';

class EmployeeToDateField extends StatelessWidget {
  final DateTime? intialDate;
  final VoidCallback? onDateChange;
  const EmployeeToDateField(
      {Key? key, required this.intialDate, this.onDateChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDateField(
      firstDate: intialDate,
      name: AddEmployeesFormKeys.toDate,
      validator: FormBuilderValidators.compose([
        (value) {
          if (value != null &&
              intialDate != null &&
              value.isBefore(intialDate!)) {
            return "To date cannot be before from date";
          }
          return null;
        }
      ]),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      noDateSelectionAllowed: true,
      onDateChange: onDateChange,
    );
  }
}
