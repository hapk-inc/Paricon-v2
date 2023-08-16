import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../theme/login_theme.dart';
import 'l_alreadyExisting.dart';
import 'l_dots.dart';
import 'l_form.dart';
import 'l_title.dart';

final TextEditingController _nameController = TextEditingController();

class LoginP extends StatelessWidget {
  final LoginTheme theme;
  const LoginP({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            //child: LoginTitle(theme: theme),
            child: const LoginForm(),
          ),
          Container(
            //height: 90.h,
            margin: EdgeInsets.symmetric(vertical: 15.h),
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            alignment: Alignment.centerLeft,
            child: Consumer(
              builder: (_, ref, __) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    /* onPressed: () => ref.read(gSignProvider.future).catchError(
                      (e, s) {
                        if (kDebugMode) {
                          print(e);
                        }
                        ref.read(anonymousProvider);
                      },
                    ),*/
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
                  ),
                  //SizedBox(width: 120.w),
                  LDots(theme: theme),
                ],
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: Lottie.asset(
              'assets/jigsaw_green.json',
              repeat: false,
            ),
          ),
          LAlreadyExisting(theme: theme)
        ],
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
