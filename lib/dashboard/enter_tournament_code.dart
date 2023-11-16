import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/my_color.dart';

class EnterTournamentCode extends StatelessWidget {
  const EnterTournamentCode({super.key});

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      tappable: false,
      closedElevation: 0,
      closedColor: ghostWhite,
      closedBuilder: (_, void Function() action) => Container(
        padding: EdgeInsets.all(15.r),
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
                    "Ready, Set, Game : Join the Tournament",
                    style: TextStyle(
                      fontSize: 24.r,
                      fontFamily: 'DelaGothic',
                      height: 1.8.r,
                      color: cinerous,
                    ),
                    maxLines: 3,
                  ),
                  AutoSizeText(
                    "Challenge the Best, Be the Best – It's Your Time to Dominate!",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          height: 2.1.r,
                          color: cinerous.withOpacity(0.75),
                          letterSpacing: 0,
                        ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 24.r),
              height: 51.r,
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
                        width: 240.w,
                        color: lavenderWeb,
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
                              fontSize: 12.r,
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
