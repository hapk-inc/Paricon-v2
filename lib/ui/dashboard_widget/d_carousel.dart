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
        items: [
          Container(
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
                      height: 54.h,
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(horizontal: 9.r),
                      alignment: Alignment.centerLeft,
                      child: AnimatedTextKit(
                        pause: const Duration(seconds: 15),
                        animatedTexts: ["Exciting", "Engaging", "Challenging"]
                            .map(
                              (e) => RotateAnimatedText(
                                e,
                                duration: const Duration(milliseconds: 300),
                                alignment: Alignment.centerLeft,
                                textStyle: TextStyle(
                                  fontFamily: 'DelaGothic',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 30.r,
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
                      padding: EdgeInsets.symmetric(horizontal: 9.r),
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
                                ..onTap = () => context.router
                                    .push(const TournamentRoute()),
                            ),
                            const TextSpan(
                              text: "?",
                              style: TextStyle(),
                            ),
                          ],
                          style: TextStyle(
                            height: 2.25,
                            fontSize: 15.r,
                            fontFamily: 'Poppins',
                            letterSpacing: 0.03.r,
                            fontWeight: FontWeight.w400,
                            color: caputMortuum,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    //  Spacer(),
                    Container(
                      margin: EdgeInsets.all(9.r),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 12.r),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll(bitterSweet)),
                        onPressed: () {},
                        child: Text(
                          "Play Now",
                          style: TextStyle(
                              color: ghostWhite,
                              fontFamily: 'Montserrat',
                              fontSize: 15.r),
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
          ),
          Container(
            margin: EdgeInsets.only(right: 7.5.w),
            decoration: BoxDecoration(
              color: lightOrange,
              borderRadius: BorderRadius.circular(7.5.r),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: -45.r,
                  left: -165.r,
                  height: 240.r,
                  width: 240.r,
                  child: Lottie.asset(
                    'lottie/trophies.json',
                    repeat: false,
                  ),
                ),
              ],
            ),
          )
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

class DashCarousel1 extends StatelessWidget {
  const DashCarousel1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: darkGreen,
      padding: EdgeInsets.only(left: 12.w, right: 9.w),
      child: CarouselSlider(
        items: [
          Container(
            decoration: BoxDecoration(
              color: jasmine,
              borderRadius: BorderRadius.circular(7.5.r),
            ),
            // constraints: const BoxConstraints.expand(),
            margin: EdgeInsets.only(right: 9.r),
            padding: EdgeInsets.only(left: 9.r, top: 9.r, right: 9.r),
            child: Wrap(
              //runAlignment: WrapAlignment.center,
              runSpacing: .15.r,
              children: [
                Container(
                  height: 45.h,
                  alignment: Alignment.centerLeft,
                  child: AnimatedTextKit(
                    pause: const Duration(milliseconds: 300),
                    animatedTexts: ["Exciting", "Engaging", "Challenging"]
                        .map(
                          (e) => RotateAnimatedText(e,
                              duration: const Duration(milliseconds: 900),
                              alignment: Alignment.centerLeft,
                              textStyle: TextStyle(
                                fontFamily: 'DelaGothic',
                                fontSize: 30.r,
                                color: [
                                  rosePink,
                                  cerise,
                                  amaranthPurple
                                ][mockInteger(0, 2)],
                              ),
                              rotateOut: false),
                        )
                        .toList(),
                    totalRepeatCount: 1,
                    //repeatForever: true,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(text: "puzzles await you. "),
                      const TextSpan(
                        text: "Are you ready for the ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 2.1,
                        ),
                      ),
                      TextSpan(
                        text: "challenge",
                        style: TextStyle(
                          color: pakistanGreen,
                          fontFamily: 'Montserrat',
                          fontSize: 15.6.r,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.2,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              context.router.push(const TournamentRoute()),
                      ),
                      const TextSpan(
                        text: "?",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 3,
                        ),
                      ),
                      const TextSpan(text: " Click here")
                    ],
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: oxfordBlue,
                      fontSize: 15.r,
                      height: 2.4,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: azure,
              borderRadius: BorderRadius.circular(4.5.r),
            ),
            padding: EdgeInsets.only(left: 9.r, top: 9.r),
            constraints: const BoxConstraints.expand(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 6.r),
                    child: const ShortLeaderBoard(),
                  ),
                )
              ],
            ),
          ),
        ],
        options: CarouselOptions(
          padEnds: false,
          enableInfiniteScroll: false,
          viewportFraction: 0.6,
          aspectRatio: 1.5,
          enlargeCenterPage: true,
          enlargeFactor: 0.15,
        ),
      ),
    );
  }
}
