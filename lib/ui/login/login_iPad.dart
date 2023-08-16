import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:paricon/ui/login/l_title.dart';

import '../../theme/login_theme.dart';
import 'l_alreadyExisting.dart';
import 'l_button.dart';
import 'l_dots.dart';
import 'l_form.dart';

class LoginIpad extends StatelessWidget {
  final LoginTheme theme;
  const LoginIpad({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 9.w, right: 9.w),
      /* decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffFBF9FF),
            Color(0xffFBF8FF),
            Color(0xffE2DAF2),
          ],
        ),
      ),*/
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180.h,
              margin: EdgeInsets.symmetric(vertical: 15.h),
              child: const LoginForm(hintSize: 10.5),
              /*child: LoginTitle(
                theme: theme,
                tFontSize: 13.5.sp,
                subFontSize: 7.5.sp,
              ),*/
              /*  child: AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Engage and Unlock "
                          "your Mind's Potential\n",
                      style: TextStyle(
                        fontSize: 16.5.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: "Challenge yourself in the Puzzle Universe and "
                          "seize victory in competitive tournaments.",
                      style: TextStyle(
                        fontFamily: 'Cabin',
                        fontSize: 9.sp,
                        height: 2.1,
                      ),
                    )
                  ],
                ),
              ),*/
            ),
            Container(
              //height: 90.h,
              margin: EdgeInsets.symmetric(vertical: 7.5.h),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              //alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LButton(txtSize: 9, hMargin: 9),
                  /*   ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 3.w),
                      child: Text(
                        "Let's Get started",
                        style: TextStyle(fontSize: 7.5.sp),
                      ),
                    ),
                  ),*/
                  LDots(theme: theme, bigR: 9.6, smallR: 7.2)
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 1.35,
              child: Lottie.asset(
                'assets/jigsaw_green.json',
                alignment: Alignment.center,
                repeat: false,
              ),
            ),
            /* Container(
              margin: EdgeInsets.symmetric(vertical: 15.h),
              child: Row(
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontFamily: 'Cabin',
                      fontSize: 10.5.sp,
                      color: const Color(0xff232528),
                    ),
                  ),
                  SizedBox(width: 3.w),
                  InkWell(
                    onTap: () {
                      print("Log In");
                    },
                    child: Text(
                      "Use Existing Email",
                      style: TextStyle(
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w900,
                        color: Color(0xffA52422),
                        fontSize: 10.5.sp,
                      ),
                    ),
                  ),
                ],
              ),
            )*/
            LAlreadyExisting(theme: theme, txtSize: 10.5)
          ],
        ),
      ),
    );
  }
}
