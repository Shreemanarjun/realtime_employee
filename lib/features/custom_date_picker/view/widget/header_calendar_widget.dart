import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realtime_employee/const/custom_button_styles.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderCalendarWidget extends StatefulWidget {
  final DateTime? selectedDay;
  final bool noDateSelectionAllowed;
  final void Function(DateTime? date) onDateChanged;
  const HeaderCalendarWidget({
    Key? key,
    required this.selectedDay,
    required this.onDateChanged,
    required this.noDateSelectionAllowed,
  }) : super(key: key);

  @override
  State<HeaderCalendarWidget> createState() => _HeaderCalendarWidgetState();
}

class _HeaderCalendarWidgetState extends State<HeaderCalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      [
        if (widget.selectedDay != null)
          OutlinedButton(
            style: isSameDay(widget.selectedDay, DateTime.now())
                ? CustomButtonStyles.selectedBtnStyle(context)
                : CustomButtonStyles.unselectedBtnStyle(context),
            child: "Today".text.isIntrinsic.make(),
            onPressed: () => {
              widget.onDateChanged(DateTime.now()),
            },
          ).expand(),
        20.widthBox,
        if (widget.selectedDay != null)
          OutlinedButton(
            style: isSameDay(widget.selectedDay,
                    DateTime.now().add(const Duration(days: 7)))
                ? CustomButtonStyles.selectedBtnStyle(context)
                : CustomButtonStyles.unselectedBtnStyle(context),
            child: "Next ${DateFormat('EEEE').format(widget.selectedDay!)}"
                .text
                .isIntrinsic
                .make(),
            onPressed: () {
              widget.onDateChanged((widget.selectedDay ?? DateTime.now())
                  .add(const Duration(days: 7)));
            },
          ).expand(),
      ]
          .hStack(alignment: MainAxisAlignment.spaceBetween)
          .pSymmetric(h: 8, v: 4),
      if (widget.selectedDay != null)
        [
          OutlinedButton(
            style: isSameDay(widget.selectedDay,
                    DateTime.now().add(const Duration(days: 8)))
                ? CustomButtonStyles.selectedBtnStyle(context)
                : CustomButtonStyles.unselectedBtnStyle(context),
            child:
                "Next ${DateFormat('EEEE').format(widget.selectedDay?.add(const Duration(days: 1)) ?? DateTime.now().add(const Duration(days: 1)))}"
                    .text
                    .isIntrinsic
                    .make(),
            onPressed: () {
              widget.onDateChanged(
                  (widget.selectedDay!).add(const Duration(days: 8)));
            },
          ).expand(),
          20.widthBox,
          OutlinedButton(
            style: (widget.selectedDay!.isBefore(
                      DateTime.now().add(
                        const Duration(days: 14),
                      ),
                    ) &&
                    widget.selectedDay!.isAfter(
                      DateTime.now().add(
                        const Duration(days: 7),
                      ),
                    ))
                ? CustomButtonStyles.selectedBtnStyle(context)
                : CustomButtonStyles.unselectedBtnStyle(context),
            child: "After 1 week".text.isIntrinsic.make(),
            onPressed: () => {
              widget.onDateChanged(
                  (widget.selectedDay!).add(const Duration(days: 8)))
            },
          ).expand(),
        ].hStack(alignment: MainAxisAlignment.spaceBetween).pSymmetric(
              h: 8,
              v: 4,
            )
      else
        [
          OutlinedButton(
            style: CustomButtonStyles.unselectedBtnStyle(context),
            child: "No Date".text.isIntrinsic.make(),
            onPressed: () {
              widget.onDateChanged(null);
            },
          ).expand(),
          20.widthBox,
          OutlinedButton(
            style: CustomButtonStyles.selectedBtnStyle(context),
            child: "Today".text.isIntrinsic.make(),
            onPressed: () => {
              widget.onDateChanged(DateTime.now()),
            },
          ).expand(),
        ].hStack(alignment: MainAxisAlignment.spaceBetween).pSymmetric(
              h: 8,
              v: 4,
            ),
      if (widget.noDateSelectionAllowed && widget.selectedDay != null)
        <Widget>[
          OutlinedButton(
            style: CustomButtonStyles.unselectedBtnStyle(context),
            child: "No Date".text.isIntrinsic.make(),
            onPressed: () {
              widget.onDateChanged(null);
            },
          ).p8().expand()
        ].hStack()
    ].vStack();
  }
}
