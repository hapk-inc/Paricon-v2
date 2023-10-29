import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';

import '../../my_widget/short_leaderboard.dart';
import '../../router/my_route.dart';
import '../../theme/my_color.dart';

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
          viewportFraction: 0.621,
          aspectRatio: 1.5,
          enlargeCenterPage: true,
          enlargeFactor: 0.21,
        ),
      ),
    );
  }
}

class DCarouselSecondSlide extends StatelessWidget {
  const DCarouselSecondSlide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7.5.w),
      decoration: BoxDecoration(
        color: lightOrange,
        borderRadius: BorderRadius.circular(7.5.r),
      ),
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
            child: Lottie.asset(
              'lottie/trophies.json',
              repeat: false,
            ),
          ),
        ],
      ),
    );
  }
}

class DCarouselFirstSlide extends StatelessWidget {
  const DCarouselFirstSlide({super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(right: 7.5.w),
        decoration: BoxDecoration(
          color: lightOrange,
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        child: Stack(
          children: [
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
                    //totalRepeatCount: 3,
                    repeatForever: true,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 9.r, vertical: 1.5.r),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(text: "puzzles await you. "),
                        const TextSpan(
                          text: "Are you ready for the ",
                        ),
                        TextSpan(
                          text: "challenge",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                context.router.push(const TournamentRoute()),
                        ),
                        const TextSpan(
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
                      onPressed: () =>
                          context.router.push(const TournamentRoute()),
                      child: Text(
                        "Play Now",
                        style: TextStyle(
                            color: ghostWhite,
                            fontFamily: 'Montserrat',
                            fontSize: 13.5.r),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: -45.r,
              right: -75.r,
              height: 240.r,
              width: 240.r,
              child: Lottie.asset(
                'lottie/trophies.json',
                repeat: false,
              ),
            )
          ],
        ),
      );
}

class DCarouselThirdSlide extends StatelessWidget {
  const DCarouselThirdSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7.5.w),
      decoration: BoxDecoration(
        color: lightOrange,
        borderRadius: BorderRadius.circular(7.5.r),
      ),
    );
  }
}
