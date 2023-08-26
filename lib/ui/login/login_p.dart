import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../logic/s_size.dart';
import '../../theme/my_color.dart';
import 'already_existing.dart';
import 'engage_and_unlock.dart';

class LoginP extends ConsumerStatefulWidget {
  const LoginP({super.key});

  @override
  ConsumerState createState() => _LoginPState();
}

class _LoginPState extends ConsumerState<LoginP> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 240.h,
          color: gunMetal,
          alignment: Alignment.centerLeft,
          child: LayoutBuilder(
            builder: (_, p1) => Stack(
              children: [
                Positioned(
                  right: -p1.maxWidth * 0.1,
                  top: p1.maxHeight * 0.1,
                  bottom: p1.maxHeight * 0.1,
                  width: p1.maxWidth * 0.45,
                  child: Lottie.asset(
                    'assets/profile_mobile.json',
                    repeat: true,
                  ),
                ),
                Positioned(
                  left: p1.maxWidth * 0.03,
                  width: p1.maxWidth * 0.6,
                  top: p1.maxHeight * 0.15,
                  bottom: p1.maxHeight * 0.06,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: EngageAndUnlock(tFontSize: 18, subFontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
        const LoginRegister(),
      ],
    );
  }
}

class LoginRegister extends ConsumerWidget {
  const LoginRegister({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    return LayoutBuilder(
      builder: (_, p1) => Container(
        padding: EdgeInsets.symmetric(
            horizontal: p1.maxWidth * 0.03, vertical: 15.h),
        child: Column(
          children: [
            Container(
              height: 60.h,
              margin: EdgeInsets.only(bottom: 15.h, right: 15.w),
              child: TextFormField(
                enabled: true,
                expands: true,
                maxLines: null,
                style: TextStyle(
                  fontSize: 15.r,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  color: gunMetal,
                ),
                decoration: InputDecoration(
                  suffix: InkWell(
                    onTap: () {},
                    child: Text(
                      "LOGIN NOW",
                      style: TextStyle(
                        fontSize: 15.r,
                        fontFamily: 'Poppins',
                        color: pistachio,
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: spaceCadet,
                      width: 0.6.r,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: frenchGray, width: 0.6.r),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: barnRed),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  labelText: 'Enter your Email',
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15.r,
                    fontWeight: FontWeight.normal,
                    color: frenchGray,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.h),
              child: Row(
                children: [
                  Text(
                    "Or Login with",
                    style: TextStyle(
                      color: blackOlive,
                      fontSize: 14.r,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 15.w,
                      endIndent: 30.w,
                      color: frenchGray,
                      thickness: 0.6.r,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 360.w,
              margin: EdgeInsets.symmetric(vertical: 15.h),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                //alignment: WrapAlignment.end,
                children: [
                  //Text("or Sign in with"),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffDDDBE0),
                        borderRadius: BorderRadius.circular(9.r)),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(12.r),
                    constraints: BoxConstraints.tight(Size.square(54.r)),
                    child: Image.asset('assets/gLogo.png'),
                  ),
                  if (sSize == ScreenSize.tab || sSize == ScreenSize.iPad)
                    const Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: AlreadyExisting()),
                    )
                ],
              ),
            ),
            if (sSize == ScreenSize.phone)
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.h),
                alignment: Alignment.centerLeft,
                child: const AlreadyExisting(),
              )
          ],
        ),
      ),
    );
  }
}
