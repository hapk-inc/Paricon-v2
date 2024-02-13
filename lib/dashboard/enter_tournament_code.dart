import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../router/my_route.dart';
import '../theme/my_color.dart';

class EnterTournamentCode extends ConsumerWidget {
  const EnterTournamentCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
        margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
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
                  onTap: () {
                    /* ref.read(dashboardPanelNotifierProvider).openBuilder =
                            TournamentCodeOpen(action);
                        action.call();*/
                  },
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
                  onTap: () => context.router.push(const TournamentRoute()),
                  child: Center(
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: ghostWhite,
                        fontSize: 13.5.r,
                        fontWeight: FontWeight.w700,
                      ),
                      child: AnimatedTextKit(
                        onTap: () =>
                            context.router.push(const TournamentRoute()),
                        animatedTexts: [
                          'PLAY NOW',
                          'TRY NOW',
                          'START NOW',
                        ]
                            .map(
                              (e) => ScaleAnimatedText(
                                e,
                                duration: const Duration(milliseconds: 1200),
                              ),
                            )
                            .toList(),
                        isRepeatingAnimation: true,
                        pause: const Duration(milliseconds: 300),
                        repeatForever: true,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
