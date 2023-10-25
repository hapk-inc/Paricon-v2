import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/my_color.dart';

class LoginOptionButton extends StatelessWidget {
  const LoginOptionButton(
      {super.key, required this.lChild, required this.optionBtnPressed});

  final VoidCallback optionBtnPressed;
  final Widget lChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.5.r),
        border: Border.all(color: pictonBlue, width: 1.r),
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

class LoginTextField extends StatelessWidget {
  const LoginTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 60.h,
      // width: 240.w,
      alignment: Alignment.centerLeft,
      //padding: EdgeInsets.symmetric(horizontal: 15.r),
      //margin:
      //    EdgeInsets.symmetric(horizontal: 7.5.r, vertical: 24.r),
      child: TextFormField(
        enabled: true,
        cursorColor: Colors.indigo,
        expands: true,
        maxLines: null,
        style: TextStyle(
          fontSize: 16.5.r,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          // color: gunMetal,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15.r),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.r),
            borderSide: BorderSide(
              //  color: spaceCadet,
              width: 0.3.r,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              // color: frenchGray,
              color: Colors.grey.shade400,
              width: 0.6.r,
            ),
            borderRadius: BorderRadius.circular(6.r),
          ),
          errorBorder: OutlineInputBorder(
            // borderSide: const BorderSide(color: barnRed),
            borderRadius: BorderRadius.circular(6.r),
          ),
          labelText: 'Email',
          labelStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15.r,
            fontWeight: FontWeight.normal,
            color: Colors.grey.shade400,
            // color: frenchGray,
          ),
        ),
      ),
    );
  }
}

SnackBar buildLoginSnackBar() => SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(1.5.r)),
      ),
      padding: EdgeInsets.symmetric(vertical: 18.r, horizontal: 15.r),
      content: Text(
        "Creating an anonymous user",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16.r,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
