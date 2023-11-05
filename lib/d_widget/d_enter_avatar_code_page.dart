import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../theme/my_color.dart';

class EnterAvatarCodePage extends StatelessWidget {
  const EnterAvatarCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
        color: lavenderWeb.withOpacity(0.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => context.router.pop(),
                icon: Icon(
                  Icons.close,
                  size: 21.r,
                ),
              ),
            ),
            FadeIn(
              delay: const Duration(milliseconds: 600),
              child: Text(
                [
                  "Gift your friends a new avatar",
                  "Update your friends' profiles with a new avatar."
                ][1],
                style: TextStyle(
                  fontSize: 27.r,
                  fontFamily: 'DelaGothic',
                  height: 1.8.r,
                  color: cinerous,
                ),
              ),
            ),
            Gap(7.5.r),
            FadeIn(
              delay: const Duration(milliseconds: 900),
              child: AutoSizeText(
                "You can also enter their code below and present them with new avatars.",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      height: 2.4.r,
                      color: cinerous.withOpacity(0.9),
                      letterSpacing: 0,
                    ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
