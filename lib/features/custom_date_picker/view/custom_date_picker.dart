import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:realtime_employee/features/custom_date_picker/view/widget/bottom_calendar_footer.dart';
import 'package:realtime_employee/features/custom_date_picker/view/widget/header_calendar_widget.dart';
import 'package:realtime_employee/features/custom_date_picker/view/widget/middle_calendar.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime? selectedDate;
  final DateTime focousedDate;
  final DateTime firstDate;
  final bool noDateSelectionAllowed;
  final void Function(DateTime? selectedDate) onSaveClicked;
  const CustomDatePicker({
    Key? key,
    required this.selectedDate,
    required this.focousedDate,
    required this.firstDate,
    required this.onSaveClicked,
    required this.noDateSelectionAllowed,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime? _selectedDay;
  late DateTime _focusedDay;
  late DateTime _firstDate;
  @override
  void initState() {
    _selectedDay = widget.selectedDate;
    _focusedDay = widget.focousedDate;
    _firstDate = widget.firstDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: <Widget>[
        HeaderCalendarWidget(
          selectedDay: _selectedDay,
          noDateSelectionAllowed: widget.noDateSelectionAllowed,
          onDateChanged: (date) {
            setState(() {
              _selectedDay = date;
              if (date != null) {
                _focusedDay = date;
              }
            });
          },
        ),
        MiddleCalendar(
          firstDate: _firstDate,
          selectedDate: _selectedDay,
          focousedDate: _focusedDay,
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay; // update `_focusedDay` here as well
            });
          },
          onFocusedDayChanged: (focousedDay) {
            setState(() {
              _focusedDay = focousedDay;
            });
          },
        ),
        const Divider(),
        BottomCalendarFooter(
          selectedDate: _selectedDay,
          onSaveDate: () {
            widget.onSaveClicked(_selectedDay);
            context.router.pop();
          },
        ).flexible(),
      ].vStack(
        axisSize: MainAxisSize.min,
      ),
    );
  }
}
