import 'package:flutter/material.dart';
import 'package:realtime_employee/bootstrap.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';

class MiddleCalendar extends StatefulWidget {
  final DateTime? selectedDate;
  final DateTime focousedDate;
  final DateTime firstDate;
  final void Function(DateTime, DateTime)? onDaySelected;
  final void Function(DateTime focousedDay) onFocusedDayChanged;
  const MiddleCalendar({
    Key? key,
    required this.selectedDate,
    required this.focousedDate,
    required this.onDaySelected,
    required this.firstDate,
    required this.onFocusedDayChanged,
  }) : super(key: key);

  @override
  State<MiddleCalendar> createState() => _MiddleCalendarState();
}

class _MiddleCalendarState extends State<MiddleCalendar> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      // today's date
      focusedDay: widget.focousedDate,
      // earliest possible date
      firstDay: widget.firstDate,
      // latest allowed date
      lastDay: DateTime.now().add(const Duration(days: 100 * 365)),
      // default view when displayed
      calendarFormat: CalendarFormat.month,
      // default is Saturday & Sunday but can be set to any day.
      // instead of day, a number can be mentioned as well.
      weekendDays: const [],
      // default is Sunday but can be changed according to locale
      startingDayOfWeek: StartingDayOfWeek.sunday,
      // height between the day row and 1st date row, default is 16.0
      daysOfWeekHeight: 40.0,
      // height between the date rows, default is 52.0
      rowHeight: 60.0,
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        leftChevronIcon: (widget.focousedDate.month == widget.firstDate.month &&
                widget.focousedDate.year == widget.firstDate.year)
            ? const SizedBox.shrink()
            : const Icon(
                Icons.arrow_left,
                size: 32,
                color: Color.fromRGBO(148, 156, 158, 1),
              ),
        rightChevronIcon: const Icon(
          Icons.arrow_right,
          size: 32,
          color: Color.fromRGBO(148, 156, 158, 1),
        ),
        leftChevronPadding: const EdgeInsets.only(
          left: 48,
        ),
        rightChevronPadding: const EdgeInsets.only(
          right: 48,
        ),
      ),
      rangeSelectionMode: RangeSelectionMode.disabled,
      weekNumbersVisible: false,
      calendarStyle: CalendarStyle(
        defaultTextStyle: TextStyle(
          color: context.primaryColor,
        ),
        selectedDecoration: BoxDecoration(
          color: context.primaryColor,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.colors.primary,
            )),
        todayTextStyle: TextStyle(
          color: context.colors.primary,
        ),
      ),
      onPageChanged: (focusedDay) {
        talker.log(focusedDay);
        widget.onFocusedDayChanged(focusedDay);
      },
      selectedDayPredicate: (day) {
        return isSameDay(widget.selectedDate, day);
      },
      onDaySelected: widget.onDaySelected,
    );
  }
}
