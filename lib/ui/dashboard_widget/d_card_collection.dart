import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';

import '../../logic/user_datastore.dart';
import '../../model/my_user.dart';
import '../../theme/my_color.dart';

class DCardCollection extends ConsumerWidget {
  const DCardCollection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: onyx,
        borderRadius: BorderRadius.circular(0.3.r),
      ),
      //margin: EdgeInsets.all(9.r),
      padding: EdgeInsets.all(15.r),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const AutoSizeText(
                        "Ask your friends to enter code below to get more avatar",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: azure,
                          fontWeight: FontWeight.w200,
                          height: 2.4,
                        ),
                        maxLines: 2,
                        maxFontSize: 12,
                        minFontSize: 6,
                        textAlign: TextAlign.right,
                      ),
                      SizedBox.square(dimension: 24.r),
                      Expanded(
                        child: Text(
                          mockString(6, 'A'),
                          style: TextStyle(
                              fontSize: 30.r,
                              fontFamily: 'DelaGothic',
                              letterSpacing: 1.5.r,
                              color: azure),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              VerticalDivider(
                indent: 9.r,
                endIndent: 9.r,
                color: azure,
                thickness: 0.45.r,
              ),
              Flexible(
                flex: 2,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 0.9,
                  child: Lottie.asset(
                    'lottie/avatar-outline.json',
                    //width: 180.r,
                    //height: 180.r,
                    repeat: false,
                    controller: const AlwaysStoppedAnimation(0.012),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            right: 0,
            bottom: -0.r,
            child: FittedBox(
              child: Text(
                "Click here to enter",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: azure,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w200,
                      fontSize: 10.8.r,
                    ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: -0.r,
            child: Text(
              "View avatars",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: azure,
                    fontFamily: 'Montserrat',
                    fontSize: 10.8.r,
                    fontWeight: FontWeight.w200,
                  ),
            ),
          )
        ],
      ),
    );
  }
}

String welcomeString(String s) =>
    ["Greetings, $s.", "Hey, $s!", "Hello, $s!"][mockInteger(0, 2)];

String get newAvatarString {
  return [
    "You've earned a cool new avatar. "
        "To use it as your profile picture, just ",
    "To set it as your profile picture, simply ",
    "Make it your profile picture with a single ",
    "Just one click away from using it as your profile picture — "
  ][mockInteger(0, 3)];
}
