import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

enum EmployeeRoles {
  productDesigner("Product Designer"),
  flutterDeveloper("Flutter Developer"),
  qaTester("QA Tester"),
  productOwner("Product Owner");

  final String role;
  const EmployeeRoles(this.role);
}

@RoutePage(
  deferredLoading: true,
)
class EmployeeRolesBottomSheetPage extends StatelessWidget {
  const EmployeeRolesBottomSheetPage({Key? key, required this.onRoleSelected})
      : super(key: key);
  final void Function(String role) onRoleSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: EmployeeRoles.values.length,
      itemBuilder: (context, index) {
        final role = EmployeeRoles.values[index];
        return TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ).copyWith(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent)),
          child: role.role.text.isIntrinsic
              .color(
                const Color.fromRGBO(50, 50, 56, 1),
              )
              .makeCentered(),
          onPressed: () {
            onRoleSelected(role.role);
          },
        );
      },
    ).safeArea();
  }
}
