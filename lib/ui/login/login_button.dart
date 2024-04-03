import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../values/colors.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onClick;
  final Widget child;
  final Color borderColor;

  const LoginButton({
    required this.onClick,
    required this.child,
    this.borderColor = pictonBlue,
    super.key,
  });

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onClick,
        iconSize: 36.r,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              side: BorderSide(color: borderColor, width: 0.72.r),
              borderRadius: BorderRadius.circular(7.5.r),
            ),
          ),
          padding: MaterialStatePropertyAll(EdgeInsets.all(7.5.r)),
        ),
        icon: ConstrainedBox(
          constraints: BoxConstraints.tight(Size.square(36.r)),
          child: child,
        ),
      );
}
