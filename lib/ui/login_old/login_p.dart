import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'login_theme.dart';
import 'l_alreadyExisting.dart';
import 'l_button.dart';
import 'l_dots.dart';
import 'l_form.dart';
import 'l_title.dart';

final TextEditingController _nameController = TextEditingController();

class LoginP extends StatelessWidget {
  final LoginTheme theme;
  const LoginP({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      maxHeight: 210.h,
      backdropOpacity: 0.75,
      backdropEnabled: true,
      minHeight: 0,
      panel: Column(
        children: [
          SizedBox(
            height: 150.h,
            child: LoginForm1(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 9.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 150.h,
              // color: Colors.red,
              margin: EdgeInsets.symmetric(vertical: 15.h),
              // padding: EdgeInsets.only(left: 15.w),
              alignment: Alignment.centerLeft,
              child: LoginTitle(theme: theme),
              //child: const LoginForm(hintSize: 12),
            ),
            Container(
              //height: 90.h,
              margin: EdgeInsets.only(top: 15.h),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              alignment: Alignment.centerLeft,
              child: Consumer(
                builder: (_, ref, __) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LButton(hMargin: 18, txtSize: 12),
                    /*   ElevatedButton(
                      */ /* onPressed: () => ref.read(gSignProvider.future).catchError(
                        (e, s) {
                          if (kDebugMode) {
                            print(e);
                          }
                          ref.read(anonymousProvider);
                        },
                      ),*/ /*
                      onPressed: () {},
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xff3e4d4a)),
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 9.h,
                          horizontal: 15.w,
                        ),
                        child: Text(
                          "Get started",
                          style: TextStyle(fontSize: 13.5.sp),
                        ),
                      ),
                    ),*/
                    //SizedBox(width: 120.w),
                    LDots(theme: theme),
                  ],
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 0.9,
              child: Lottie.asset(
                'assets/profile_mobile.json',
                // 'assets/jigsaw_green.json',
                repeat: true,
              ),
            ),
            LAlreadyExisting(theme: theme, txtSize: 13.5)
          ],
        ),
      ),
    );
  }
}

/*gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffFBF9FF),
            Color(0xffFBF8FF),
            Color(0xffE2DAF2),
          ],
        ),*/
