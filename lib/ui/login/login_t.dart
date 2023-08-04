import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoginT extends StatelessWidget {
  const LoginT({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 9.w),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffFBF9FF),
            Color(0xffFBF8FF),
            Color(0xffE2DAF2),
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.h),
              child: AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Engage and Unlock "
                          "your Mind's Potential\n",
                      style: TextStyle(
                        fontSize: 16.5.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
                        height: 1.8,
                      ),
                    ),
                    TextSpan(
                      text: "Challenge yourself in the Puzzle Universe and "
                          "seize victory in competitive tournaments.",
                      style: TextStyle(
                        fontFamily: 'Cabin',
                        fontSize: 11.5.sp,
                        height: 1.8,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              //height: 90.h,
              margin: EdgeInsets.symmetric(vertical: 15.h),
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 9.h, horizontal: 10.5.w),
                  child: Text(
                    "Get started",
                    style: TextStyle(fontSize: 11.1.sp),
                  ),
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 1.2,
              child: Lottie.asset(
                'assets/jigsaw_green.json',
                repeat: false,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.h),
              child: Row(
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontFamily: 'Cabin',
                      fontSize: 9.sp,
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
                        color: const Color(0xffA52422),
                        fontSize: 9.sp,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
