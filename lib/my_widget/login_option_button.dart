import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/my_color.dart';

class LoginOptionButton extends StatelessWidget {
  const LoginOptionButton({
    super.key,
    required this.lChild,
    this.bColor = pictonBlue,
    this.borderWidth = 1.2,
    required this.optionBtnPressed,
  });

  final VoidCallback? optionBtnPressed;
  final double? borderWidth;
  final Widget lChild;
  final Color? bColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.5.r),
        border: Border.all(
          color: bColor ?? pictonBlue,
          width: (borderWidth)!.r,
        ),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.5.r),
      constraints: BoxConstraints.tight(Size.square(48.r)),
      child: InkWell(
        onTap: optionBtnPressed,
        child: lChild,
      ),
    );
  }
}

SnackBar buildLoginSnackBar({String? email = "abc"}) => SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(1.5.r)),
      ),
      padding: EdgeInsets.symmetric(vertical: 18.r, horizontal: 15.r),
      content: Text(
        email == null
            ? "Loading"
            : email == "abc"
                ? "Creating an anonymous user"
                : "Signing in as $email",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16.r,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
