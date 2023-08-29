import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/panel_controller.dart';
import '../../theme/my_color.dart';

class AlreadyExisting extends ConsumerWidget {
  const AlreadyExisting({super.key, this.txtSize = 14});

  final double txtSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final panelController = ref.watch(panelProvider);
    return LayoutBuilder(
      builder: (_, p1) => AnimatedDefaultTextStyle(
        style: TextStyle(
          fontFamily: 'Cabin',
          fontSize: txtSize.r,
          color: beaver,
        ),
        duration: const Duration(milliseconds: 500),
        child: Wrap(
          runSpacing: 9.h,
          spacing: p1.maxWidth * 0.009,
          children: [
            const Text("Don't have an account?"),
            InkWell(
              onTap: () {
                print("Log In");
                if (!panelController.isPanelOpen) {
                  panelController.open();
                } else {
                  panelController.close();
                }
              },
              child: const Text(
                "Register",
                style: TextStyle(
                  color: sealBrown,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
