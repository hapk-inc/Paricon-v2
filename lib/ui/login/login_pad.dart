import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_p.dart';

class LoginPad extends StatelessWidget {
  const LoginPad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: AnimatedContainer(
        width: 270.w,
        height: 840.h,
        duration: const Duration(milliseconds: 500),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9.r),
            child: const LoginP(),
          ),
        ),
      ),
      // color: Colors.blue,
    );
  }
}
