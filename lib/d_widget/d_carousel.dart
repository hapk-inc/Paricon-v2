import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';

import '../logic/first_user.dart';
import '../logic/tournament_listener.dart';
import '../logic/user_provider.dart';
import '../model/my_duration.dart';
import '../model/p_user.dart';
import '../router/my_route.dart';
import '../theme/my_color.dart';
import 'd_short_leaderboard.dart';

class DashCarousel extends StatelessWidget {
  const DashCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: CarouselSlider(
        items: const [
          DCarouselFirstSlide(),
          DCarouselSecondSlide(),
          DCarouselThirdSlide(),
        ],
        options: CarouselOptions(
          padEnds: false,
          enableInfiniteScroll: false,
          viewportFraction: 0.63,
          aspectRatio: 1.5,
          enlargeCenterPage: true,
          enlargeFactor: 0.21,
        ),
      ),
    );
  }
}

class DCarouselFirstSlide extends ConsumerWidget {
  const DCarouselFirstSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyDuration? myDuration = ref.watch(myUserDurationProvider).value;
    return CarouselContainer(
      mChild: Stack(
        children: [
          Positioned(
            bottom: -45.r,
            right: -75.r,
            height: 240.r,
            width: 240.r,
            child: Lottie.asset('lottie/trophies.json', repeat: false),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 48.r,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 9.r),
                alignment: Alignment.centerLeft,
                child: AnimatedTextKit(
                  pause: const Duration(seconds: 9),
                  animatedTexts: ["Exciting", "Engaging", "Challenging"]
                      .map(
                        (e) => RotateAnimatedText(
                          e,
                          duration: const Duration(milliseconds: 300),
                          alignment: Alignment.centerLeft,
                          textStyle: TextStyle(
                            fontFamily: 'DelaGothic',
                            fontWeight: FontWeight.w900,
                            fontSize: e.length > 8 ? 27.r : 30.r,
                            color: [
                              bitterSweet,
                              cerise,
                              amaranthPurple
                            ][mockInteger(0, 2)],
                          ),
                          rotateOut: false,
                        ),
                      )
                      .toList(),
                  repeatForever: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.r, vertical: 1.5.r),
                child: RichText(
                  text: TextSpan(
                    children: const [
                      TextSpan(text: "puzzles await you. "),
                      TextSpan(
                        text: "Are you ready for the ",
                      ),
                      TextSpan(
                        text: "challenge",
                        /*recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              context.router.push(const TournamentRoute()),*/
                      ),
                      TextSpan(
                        text: "?",
                        style: TextStyle(),
                      ),
                    ],
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: caputMortuum,
                          //fontSize: 13.8.r,
                          fontFamily: 'Poppins',
                          height: 2.4,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              //  Spacer(),
              if (myDuration != null)
                Container(
                  margin: EdgeInsets.all(9.r),
                  child: FadeIn(
                    delay: const Duration(seconds: 3),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 12.r),
                          ),
                          backgroundColor:
                              const MaterialStatePropertyAll(bitterSweet)),
                      onPressed: () {
                        ref.refresh(tournamentListenerNotifierProvider);
                        context.router.push(const TournamentRoute());
                      },
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          myDuration.lastGamePlayed != null
                              ? "Play Now"
                              : "Play your first game",
                          style: TextStyle(
                            color: ghostWhite,
                            fontFamily: 'Montserrat',
                            fontSize: 13.5.r,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}

class DCarouselSecondSlide extends StatelessWidget {
  const DCarouselSecondSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselContainer(
      mChild: ClipRRect(
        borderRadius: BorderRadius.circular(7.5.r),
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.r),
                child: const ShortLeaderBoard(),
              ),
              Positioned(
                bottom: -45.r,
                left: -162.r,
                height: 240.r,
                width: 240.r,
                child: Lottie.asset('lottie/trophies.json', repeat: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DCarouselThirdSlide extends ConsumerWidget {
  const DCarouselThirdSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final QueryDocumentSnapshot<PUser>? firstUser =
        ref.watch(firstRankProvider).value;

    return OpenContainer(
      tappable: false,
      closedElevation: 0,
      closedBuilder: (BuildContext context, void Function() action) =>
          CarouselContainer(
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
                      /*TextSpan(
                        text: onlyMMSS(firstUser.data().bestDuration!),
                        style: TextStyle(
                          fontSize: 21.r,
                          //color: oldRose,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      TextSpan(
                        text: "${onlyMilli(firstUser.data().bestDuration!)}",
                        style: TextStyle(
                          fontSize: 15.r,
                          color: oldRose,
                          fontFamily: 'Montserrat',
                        ),
                      )*/
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
              InkWell(
        onTap: () => context.router.pop(),
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}

class CarouselContainer extends StatelessWidget {
  final Widget mChild;
  const CarouselContainer({required this.mChild, super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(right: 7.5.w),
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: lightOrange,
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        child: mChild,
      );
}

/*
* ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            decoration: BoxDecoration(
              color: caputMortuum,
              borderRadius: BorderRadius.circular(7.5.r),
            ),
            child: Stack(
              children: [
                Center(
                  child: Lottie.asset(
                    'lottie/trophy.json',
                    height: 120.r,
                    width: 120.r,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  right: 15.r,
                  top: 15.r,
                  child: Text(
                    "View LeaderBoard",
                    style: TextStyle(
                      fontSize: 12.r,
                      fontFamily: 'Montserrat',
                      color: charcoal.withOpacity(0.6),
                    ),
                  ),
                ),
                if (firstUser != null)
                  Positioned(
                    bottom: 0,
                    height: 60.h,
                    left: 0,
                    right: 0,
                    child: LayoutBuilder(
                      builder: (_, constraint) {
                        final double pW = constraint.maxWidth;
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.symmetric(
                              horizontal:
                                  BorderSide(color: lightOrange, width: 0.6.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: pW * 0.15,
                                margin: EdgeInsets.only(left: pW * 0.03),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "01",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18.r,
                                    color: lightOrange,
                                  ),
                                ),
                              ),
                              Container(
                                width: pW * 0.39,
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  firstUser.data().name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15.r,
                                    color: lightOrange,
                                    fontFamily: 'Montserrat',
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(
                                width: pW * 0.36,
                                child: AutoSizeText.rich(
                                  showTScore(
                                    firstUser.data().bestDuration!,
                                    minute: lightOrange,
                                    mm: lightOrange,
                                  ),
                                  style: TextStyle(fontSize: 15.r),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
              ],
            ),
          ),
        )*/
