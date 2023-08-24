import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EmployeesTypeHeader extends StatelessWidget {
  final String text;
  const EmployeesTypeHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text.text.lg.heightRelaxed.semiBold
        .color(context.primaryColor)
        .make()
        .p16()
        .box
        .height(56)
        .gray100
        .make();
  }
}
