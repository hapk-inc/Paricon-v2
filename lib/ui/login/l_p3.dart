import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/auth.dart';
import '../../my_widgets/my_logo.dart';

class LoginP extends StatelessWidget {
  const LoginP({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff724cf9),
            Color(0xff9467FF),
            Color(0xffB584FF),
            Color(0xffD6A1FF),
          ],
        ),
      ),
      padding: EdgeInsets.all(3.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Stack(
                children: [
                  Positioned.fill(
                    left: -9.w,
                    child: const MyLogo(),
                  ),
                ],
              ),
            ),
          ),
          //SizedBox(height: 30.h),
          //Spacer(),
          Flexible(
            flex: 2,
            child: FractionallySizedBox(
              heightFactor: 1,
              child: Container(
                //color: Colors.teal,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: FractionallySizedBox(
                        heightFactor: 1,
                        child: AutoSizeText(
                          "Engage and Unlock your Mind's Potential",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 21.sp,
                            //color: const Color(0xff2a2a72),
                            //color: const Color(0xffffa400),
                            color: const Color(0xffEFF2C0),
                            fontFamily: 'Poppins',
                            height: 1.8,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Flexible(
                      child: FractionallySizedBox(
                        heightFactor: 1,
                        child: AutoSizeText(
                          "Challenge yourself in the Puzzle Universe and seize victory in competitive tournaments.",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'Cabin',
                            //color: const Color(0xffF5F9E9),
                            // color: const Color(0xffFFA400),
                            //color: const Color(0xffdddddf),
                            //color: const Color(0xffBEA57D),
                            //color: const Color(0xff080F0F),
                            color: const Color(0xffEFF2C0),
                            height: 1.5,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          /*  Container(
            height: 30.h,
            margin: EdgeInsets.symmetric(vertical: 15.h),
            //color: Colors.red,
          ),*/
          Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.72,
              widthFactor: 0.9,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 3.h),
                child: Consumer(
                  builder: (__, ref, _) => ElevatedButton(
                    onPressed: () => ref.read(gSignProvider.future).catchError(
                      (e, s) {
                        if (kDebugMode) {
                          print(e);
                        }
                        ref.read(anonymousProvider);
                      },
                    ),
                    style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(6),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.sp),
                        ),
                      ),
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0xff232528),
                      ),
                    ),
                    child: Text(
                      "Getting Started",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Flexible(child: FractionallySizedBox(heightFactor: 0.3)),
          //SizedBox(height: 45.h),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 4,
                  child: FractionallySizedBox(
                    widthFactor: .9,
                    //heightFactor: 0.9,
                    child: FittedBox(
                      child: Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontFamily: 'Cabin',
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff232528),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 6.w),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      print("Log In");
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w900,
                        color: Color(0xffA52422),
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
