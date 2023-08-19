import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../login/login_theme.dart';
import '../login/login_p.dart';

class LoginT extends ConsumerWidget {
  const LoginT({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double aRatio = 900.h / 360.w;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff724cf9),
            Color(0xff724cf9),
            Color(0xff9467FF),
            Color(0xffB584FF),
            Color(0xffD6A1FF),
          ],
        ),
      ),
      padding: EdgeInsets.all(3.sp),
      child: Row(
        children: [
          Flexible(
            flex: aRatio > 1.5 ? 7 : 3,
            child: Container(),
            // child: LoginP(theme: LoginTheme()),
          ),
          //Spacer()
        ],
      ),
    );
  }
}
