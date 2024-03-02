import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/my_color.dart';

class LoginOptionButton extends StatelessWidget {
  final VoidCallback? optionBtnPressed;
  final Widget lChild;
  final Color bColor;

  const LoginOptionButton({
    required this.optionBtnPressed,
    required this.lChild,
    this.bColor = pictonBlue,
    super.key,
  });

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: optionBtnPressed,
        iconSize: 36.r,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              side: BorderSide(color: bColor, width: 0.48.r),
              borderRadius: BorderRadius.circular(7.5.r),
            ),
          ),
          padding: MaterialStatePropertyAll(EdgeInsets.all(7.5.r)),
        ),
        icon: lChild,
      );
}
