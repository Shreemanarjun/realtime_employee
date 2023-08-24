import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:realtime_employee/features/custom_date_picker/view/custom_date_picker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomDateField extends StatelessWidget {
  final String name;
  final DateTime? firstDate;
  final String? Function(DateTime?)? validator;
  final AutovalidateMode? autovalidateMode;
  final VoidCallback? onDateChange;
  final bool noDateSelectionAllowed;
  const CustomDateField({
    Key? key,
    required this.name,
    this.firstDate,
    this.validator,
    this.autovalidateMode,
    this.onDateChange,
    this.noDateSelectionAllowed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<DateTime>(
      name: name,
      validator: validator,
      autovalidateMode: autovalidateMode,
      initialValue: firstDate,
      builder: (FormFieldState<DateTime> field) {
        return TextField(
          readOnly: true,
          controller: TextEditingController(
              text: field.value != null
                  ? (isSameDay(field.value, DateTime.now())
                      ? "Today"
                      : DateFormat("dd MMM yyyy").format(field.value!))
                  : ""),
          decoration: InputDecoration(
            hintText: 'No date',
            prefixIcon: Icon(
              Icons.event_outlined,
              color: context.primaryColor,
            ),
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
            contentPadding: const EdgeInsets.all(8),
            constraints: BoxConstraints.tight(
              Size.fromHeight(field.errorText != null ? 84 : 48),
            ),
            errorText: field.errorText,
            helperText: '',
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => CustomDatePicker(
                firstDate: firstDate ?? DateTime.now(),
                focousedDate: field.value ?? firstDate ?? DateTime.now(),
                selectedDate: field.value,
                onSaveClicked: (selectedDate) {
                  field.didChange(selectedDate);
                  onDateChange?.call();
                },
                noDateSelectionAllowed: noDateSelectionAllowed,
              ),
            );
          },
        );
      },
    );
  }
}
