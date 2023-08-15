import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:mock_data/mock_data.dart';

import '../../logic/auth.dart';
import '../../theme/login_theme.dart';

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
            child: _LoginTitle(theme: theme),
            //child: const LoginForm(),
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
                  DotsIndicator(
                    dotsCount: 3,
                    position: 1,
                    decorator: DotsDecorator(
                      activeColor: theme.roundHighlight,
                      color: theme.roundBg,
                      activeSize: Size.square(12.w),
                      size: Size.square(9.6.w),
                      spacing: EdgeInsets.only(right: 9.w),
                    ),
                  ),
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
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.h),
            child: Row(
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontFamily: 'Cabin',
                    fontSize: 13.5.sp,
                    // color: const Color(0xff232528),
                    color: theme.already,
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
                      fontWeight: FontWeight.w500,
                      //color: const Color(0xffA52422),
                      color: theme.useExisting,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(left: 15.w),
        child: Shortcuts(
          shortcuts: const <ShortcutActivator, Intent>{
            // Pressing space in the field will now move to the next field.
            SingleActivator(LogicalKeyboardKey.enter): NextFocusIntent(),
          },
          child: FocusTraversalGroup(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              onChanged: () {
                Form.of(primaryFocus!.context!).save();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List<Widget>.generate(
                  2,
                  (int index) {
                    return FadeInRight(
                      delay: Duration(milliseconds: (index + 1) * 100),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tight(Size(300.w, 60.h)),
                        child: TextFormField(
                          onSaved: (String? value) {
                            debugPrint(
                                'Value for field $index saved as "$value"');
                          },
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: index == 0 ? 18.w : 15.w,
                            shadows: const <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 4.5.w),
                            hintText: index == 0
                                ? "Name"
                                : "Your Birthday (optional)",
                            suffixText:
                                index == 0 ? "Ex: ${mockName()}" : "DD-MM-YYYY",
                            suffixStyle: TextStyle(
                              fontSize: 12.w,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Cabin',
                              color: Colors.grey,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15.w,
                              fontWeight: FontWeight.w300,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.5.h),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );
}

class _LoginTitle extends StatelessWidget {
  const _LoginTitle({
    super.key,
    required this.theme,
  });

  final LoginTheme theme;

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: AutoSizeText.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "Engage and Unlock your Mind's Potential\n",
              style: TextStyle(
                fontSize: 21.sp,
                fontFamily: 'Montserrat',
                color: theme.title,
                fontWeight: FontWeight.w900,
                height: 1.8,
              ),
            ),
            TextSpan(
              text:
                  "Challenge yourself in the Puzzle Universe and seize victory "
                  "in competitive tournaments.",
              style: TextStyle(
                fontFamily: 'Cabin',
                fontSize: 13.5.sp,
                height: 1.8,
                color: theme.subTitle,
              ),
            )
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
