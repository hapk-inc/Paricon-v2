import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../theme/my_color.dart';
import '../ui/host_room.dart';

class EnterTournamentCode extends StatelessWidget {
  const EnterTournamentCode({super.key});

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      tappable: false,
      closedElevation: 0,
      closedColor: ghostWhite,
      closedShape:
          const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      closedBuilder: (_, void Function() action) => Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Ready, Set, Game : Join the Tournament 🏆",
                    style: TextStyle(
                      fontSize: 27.r,
                      fontFamily: 'WendyOne',
                      height: 1.8.r,
                      color: cinerous,
                    ),
                    maxLines: 3,
                  ),
                  Gap(6.r),
                  AutoSizeText(
                    "Challenge the Best, Be the Best – It's Your Time to Dominate!",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          height: 2.1.r,
                          color: cinerous,
                          letterSpacing: 0,
                        ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: EdgeInsets.symmetric(vertical: 24.r),
              height: 48.r,
              decoration: BoxDecoration(
                color: cinerous,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              child: InkWell(
                onTap: action,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7.5.r),
                  child: Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 225.w,
                        color: magnolia,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          "PARICON",
                          style: TextStyle(
                            fontFamily: 'Cabin',
                            fontSize: 15.r,
                            letterSpacing: 0.45.r,
                            fontWeight: FontWeight.w400,
                            color: vanDyke.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "ENTER CODE",
                            style: TextStyle(
                              fontFamily: 'Cabin',
                              fontSize: 13.5.r,
                              color: ghostWhite,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      openBuilder: (_, void Function({bool? returnValue}) action) => InkWell(
        onTap: action,
        child: Container(
          color: lavenderWeb,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "No Tournaments yet!",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontFamily: 'DelaGothic', color: vanDyke),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EnterAvatarCode extends StatelessWidget {
  const EnterAvatarCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Gift your friends, a new avatars",
                  style: TextStyle(
                    fontSize: 30.r,
                    fontFamily: 'WendyOne',
                    height: 1.8.r,
                    color: cinerous,
                  ),
                  maxLines: 2,
                ),
                //Gap(6.r),
                AutoSizeText(
                  "Enter their code below and present them with new avatars.",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        height: 2.1.r,
                        color: cinerous,
                        letterSpacing: 0,
                      ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: EdgeInsets.symmetric(vertical: 24.r),
            height: 48.r,
            decoration: BoxDecoration(
              color: cinerous,
              borderRadius: BorderRadius.circular(7.5.r),
            ),
            child: InkWell(
              onTap: () => showGeneralDialog(
                //barrierColor: Colors.transparent,
                barrierColor: Colors.black.withOpacity(0.72),

                transitionBuilder: (_, x, ___, __) => Transform.scale(
                  scale: x.value,
                  child: Opacity(
                    opacity: x.value,
                    child: AlertDialog(
                      backgroundColor: chocolateCosmos,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.5.r),
                        borderSide:
                            const BorderSide(width: 0, color: chocolateCosmos),
                      ),
                      title: const Text(
                        'Enter the avatar code',
                        style:
                            TextStyle(fontFamily: 'WendyOne', color: xantHous),
                      ),
                      insetPadding: EdgeInsets.symmetric(horizontal: 7.5.w),
                      content: AnimatedContainer(
                        color: chocolateCosmos,
                        duration: const Duration(milliseconds: 500),
                        height: 72.h,
                        // color: cinerous.withOpacity(0.15),
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.w,
                          vertical: 3.h,
                        ),
                        alignment: Alignment.bottomCenter,
                        child: const FilledRoundedPinPut(),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "SHARE NOW",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: ghostWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                transitionDuration: const Duration(milliseconds: 200),
                barrierDismissible: true,
                barrierLabel: '',
                context: context,
                pageBuilder: (_, animation1, animation2) => Container(),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.5.r),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 225.w,
                      color: wheat,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Text(
                        "PARICON",
                        style: TextStyle(
                          fontFamily: 'Cabin',
                          fontSize: 15.r,
                          letterSpacing: 0.45.r,
                          fontWeight: FontWeight.w400,
                          color: vanDyke,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "ENTER CODE",
                          style: TextStyle(
                            fontFamily: 'Cabin',
                            fontSize: 13.5.r,
                            color: ghostWhite,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
