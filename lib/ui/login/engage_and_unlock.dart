import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_theme.dart';

class EngageAndUnlock extends StatelessWidget {
  const EngageAndUnlock({
    super.key,
    this.tFontSize = 21,
    this.subFontSize = 13.5,
  });

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
                color: lTheme.title,
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
                height: 2.1,
                fontWeight: FontWeight.w700,
                color: lTheme.subTitle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
