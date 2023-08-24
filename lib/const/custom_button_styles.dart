import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomButtonStyles {
  CustomButtonStyles._();
  static ButtonStyle unselectedBtnStyle(BuildContext context) =>
      OutlinedButton.styleFrom(
        backgroundColor: context.colors.background.withOpacity(0.2),
        foregroundColor: context.colors.primary,
        side: const BorderSide(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        padding: EdgeInsets.zero,
      );

  static ButtonStyle selectedBtnStyle(BuildContext context) =>
      OutlinedButton.styleFrom(
        backgroundColor: context.colors.primary,
        foregroundColor: context.colors.onPrimary,
        side: const BorderSide(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        padding: EdgeInsets.zero,
      );
}
