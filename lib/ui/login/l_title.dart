import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/login_theme.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    super.key,
    required this.theme,
    this.tFontSize = 21,
    this.subFontSize = 13.5,
  });

  final LoginTheme theme;
  final num tFontSize;
  final num subFontSize;

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: AutoSizeText.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "Engage and Unlock your Mind's Potential\n",
              style: TextStyle(
                fontSize: (tFontSize).sp,
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
                fontSize: (subFontSize).sp,
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
