import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_theme.dart';

class LAlreadyExisting extends StatelessWidget {
  const LAlreadyExisting({super.key, required this.theme, this.txtSize = 12});

  final LoginTheme theme;
  final num txtSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(
              fontFamily: 'Cabin',
              fontSize: (txtSize).sp,
              // color: const Color(0xff232528),
              color: theme.already,
            ),
          ),
          SizedBox(width: 1.5.w),
          InkWell(
            onTap: () {
              print("Log In");
            },
            child: Text(
              "Use Existing Email",
              style: TextStyle(
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w500,
                //color: const Color(0xffA52422),
                color: theme.useExisting,
                fontSize: (txtSize).sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
