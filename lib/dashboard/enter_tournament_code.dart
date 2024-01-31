import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../router/my_route.dart';

import '../theme/my_color.dart';

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
                    "🏁 Ready, Set, Game : Join the Tournament 🏆",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          height: 1.8.r,
                          color: cinerous,
                        ),
                    maxLines: 3,
                  ),
                  //Gap(6.r),
                  AutoSizeText(
                    "Challenge the Best, Be the Best – It's Your Time to Dominate!",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: gray),
                    maxLines: 1,
                    minFontSize: 10.5,
                    stepGranularity: 1.5,
                    maxFontSize: 15,
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
                      child: InkWell(
                        onTap: action,
                        child: Text(
                          "PARICON",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15.r,
                            letterSpacing: 0.45.r,
                            fontWeight: FontWeight.w400,
                            color: vanDyke.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () =>
                            context.router.push(const TournamentRoute()),
                        child: Center(
                          child: Text(
                            "TRY NOW",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15.r,
                              color: ghostWhite,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
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
