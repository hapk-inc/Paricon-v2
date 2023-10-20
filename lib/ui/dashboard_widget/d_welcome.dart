import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/user_datastore.dart';
import '../../model/my_user.dart';
import '../../theme/my_color.dart';

class DWelcome extends ConsumerWidget {
  const DWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;

    return Container(
      decoration: BoxDecoration(
        color: majorelleBlue,
        borderRadius: BorderRadius.circular(7.5.r),
      ),
      margin: EdgeInsets.all(9.r),
      padding: EdgeInsets.all(15.r),
      alignment: Alignment.centerLeft,
      child: myUser == null
          ? null
          : AutoSizeText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Welcome ${myUser.name}\n",
                    style: TextStyle(
                      fontSize: 27.r,
                      fontFamily: 'DelaGothic',
                      fontWeight: FontWeight.w700,
                      color: mistyRose,
                    ),
                  ),
                  const TextSpan(
                    text: "You've earned a cool new avatar. "
                        "To use it as your profile picture, just ",
                    style: TextStyle(color: coralPink),
                  ),
                  TextSpan(
                    text: "click here.",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Scaffold.of(context).openDrawer(),
                    style: const TextStyle(color: yellowGreen),
                  )
                ],
                style: TextStyle(
                  height: 2.1,
                  fontSize: 15.r,
                  color: barnRed,
                  fontFamily: 'Poppins',
                ),
              ),
              maxLines: 3,
            ),
    );
  }
}
