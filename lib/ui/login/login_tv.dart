import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoginTV extends StatelessWidget {
  const LoginTV({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 9.h),
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
          child: Row(
            children: [
              Container(
                width: 240.w,
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                //color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12.h),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Engage and Unlock "
                                "your Mind's Potential\n",
                            style: TextStyle(
                              fontSize: 7.5.w,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w900,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text:
                                "Challenge yourself in the Puzzle Universe and "
                                "seize victory in competitive tournaments.",
                            style: TextStyle(
                              fontFamily: 'Cabin',
                              fontWeight: FontWeight.w100,
                              fontSize: 4.5.w,
                              height: 1.8,
                            ),
                          )
                        ], style: TextStyle(color: Colors.red)),
                      ),
                    ),
                    Container(
                      //height: 90.h,
                      margin: EdgeInsets.symmetric(vertical: 12.h),

                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.5.sp),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 6.h,
                            horizontal: 3.w,
                          ),
                          child: Text(
                            "Get started",
                            style: TextStyle(fontSize: 15.h),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Lottie.asset(
                  'assets/jigsaw_green.json',
                  repeat: false,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
