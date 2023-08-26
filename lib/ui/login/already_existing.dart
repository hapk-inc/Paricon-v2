import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/my_color.dart';

class AlreadyExisting extends StatelessWidget {
  const AlreadyExisting({super.key, this.txtSize = 13.5});

  final double txtSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, p1) => AnimatedDefaultTextStyle(
        style: TextStyle(
          fontFamily: 'Poppins',
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
