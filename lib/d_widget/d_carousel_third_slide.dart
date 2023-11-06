import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../logic/first_user.dart';
import '../model/p_user.dart';
import '../theme/my_color.dart';
import 'd_carousel_container.dart';
import 'view_leaderboard.dart';

class DCarouselThirdSlide extends ConsumerWidget {
  const DCarouselThirdSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final QueryDocumentSnapshot<PUser>? firstUser =
        ref.watch(firstRankProvider).value;

    return OpenContainer(
      tappable: false,
      closedElevation: 0,
      openColor: lightOrange,
      closedBuilder: (_, void Function() action) => CarouselContainer(
        mChild: Stack(
          children: [
            Positioned(
              right: -36.r,
              width: 210.r,
              top: -18.r,
              bottom: -18.r,
              child: Lottie.asset(
                'lottie/trophy.json',
                fit: BoxFit.fitHeight,
                repeat: false,
              ),
            ),
            Positioned(
              bottom: 15.r,
              left: 15.r,
              child: InkWell(
                onTap: action,
                child: Text(
                  "View LeaderBoard",
                  style: TextStyle(
                    fontSize: 12.r,
                    fontFamily: 'Montserrat',
                    color: caputMortuum.withOpacity(0.6),
                  ),
                ),
              ),
            ),
            if (firstUser != null)
              Positioned(
                top: 30.r,
                left: 15.r,
                child: AutoSizeText.rich(
                  TextSpan(
                    text: "1. ${firstUser.data().name}",
                    children: [
                      TextSpan(
                          text: " #${firstUser.data().id}",
                          style: TextStyle(
                              fontSize: 12.r,
                              color: oldRose,
                              fontFamily: 'Montserrat'))
                    ],
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: caputMortuum),
                ),
              ),
          ],
        ),
      ),
      openBuilder:
          (BuildContext context, void Function({Object? returnValue}) action) =>
              const ViewLeaderBoard(),
    );
  }
}
