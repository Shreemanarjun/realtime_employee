import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realtime_employee/const/custom_button_styles.dart';
import 'package:velocity_x/velocity_x.dart';

class BottomCalendarFooter extends StatefulWidget {
  final DateTime? selectedDate;
  final VoidCallback onSaveDate;
  const BottomCalendarFooter({
    Key? key,
    required this.selectedDate,
    required this.onSaveDate,
  }) : super(key: key);

  @override
  State<BottomCalendarFooter> createState() => _BottomCalendarFooterState();
}

class _BottomCalendarFooterState extends State<BottomCalendarFooter> {
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      <Widget>[
        Icon(
          Icons.event_outlined,
          color: context.primaryColor,
        ),
        (widget.selectedDate != null
                ? DateFormat("dd MMM yyyy").format(widget.selectedDate!)
                : "No Date")
            .text
            .heightRelaxed
            .isIntrinsic
            .make()
            .pOnly(left: 8),
      ].hStack().flexible(),
      <Widget>[
        OutlinedButton(
          style: CustomButtonStyles.unselectedBtnStyle(context),
          onPressed: () {
            context.router.pop();
          },
          child: "Cancel".text.isIntrinsic.make(),
        ).expand(),
        OutlinedButton(
          style: CustomButtonStyles.selectedBtnStyle(context),
          onPressed: () {
            widget.onSaveDate();
          },
          child: "Save".text.isIntrinsic.make(),
        ).px4().expand()
      ].hStack().flexible()
    ].hStack().pOnly(left: 16).pSymmetric(v: 8);
  }
}
