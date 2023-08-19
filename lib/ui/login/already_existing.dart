import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_theme.dart';

class AlreadyExisting extends StatelessWidget {
  const AlreadyExisting({super.key, this.txtSize = 13.5});

  final num? txtSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      alignment: Alignment.centerRight,
      child: AnimatedDefaultTextStyle(
        style: TextStyle(
          fontFamily: 'Cabin',
          fontSize: txtSize != null ? (txtSize)?.sp : 13.5.sp,
          // color: const Color(0xff232528),
          color: lTheme.already,
        ),
        duration: const Duration(milliseconds: 500),
        child: Row(
          children: [
            const Text("Already have an account?"),
            SizedBox(width: 3.w),
            InkWell(
              onTap: () {
                print("Log In");
              },
              child: Text(
                "Use Existing Email",
                style: TextStyle(
                  color: lTheme.useExisting,
                  fontWeight: FontWeight.w900,
                ),
                /*    style: TextStyle(
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.w500,
                  //color: const Color(0xffA52422),
                  color: lTheme.useExisting,
                  fontSize: (txtSize).sp,
                ),*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}
