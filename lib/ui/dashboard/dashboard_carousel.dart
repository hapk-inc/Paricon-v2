import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/routes/my_route.dart';
import '../../logic/s_size.dart';

class DashboardCarousel extends ConsumerWidget {
  const DashboardCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    return CarouselSlider(
      items: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffFFE156),
            borderRadius: BorderRadius.circular(6.w),
          ),
          margin: EdgeInsets.symmetric(vertical: 4.5.h),
          // padding: EdgeInsets.only(bottom: 9.h),
          alignment: Alignment.center,
          child: LayoutBuilder(
            builder: (_, p1) => Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 6.h,
                  width: p1.maxWidth * 0.36,
                  height: p1.maxHeight,
                  child: Lottie.asset('assets/tournament_trophies.json'),
                ),
                Positioned(
                  // top: -9.h,
                  width: p1.maxWidth,
                  height: p1.maxHeight,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 4,
                        child: ListTile(
                          isThreeLine: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: sSize == ScreenSize.phone ||
                                      sSize == ScreenSize.tab
                                  ? 15.w
                                  : 9.w),
                          title: Container(
                            margin: EdgeInsets.symmetric(vertical: 10.5.h),
                            child: const FittedBox(
                              child: Text(
                                "Start your first game",
                                maxLines: 1,
                              ),
                            ),
                          ),
                          subtitle: SizedBox(
                            height: p1.maxHeight * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FittedBox(
                                  child: Text(
                                    "Be the ${mockInteger(12, 20)}th "
                                    "Player to enter",
                                  ),
                                ),
                                SizedBox(
                                  height: p1.maxHeight * 0.24,
                                  width: p1.maxWidth * 0.18,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xff3777FF),
                                      borderRadius:
                                          BorderRadius.circular(4.5.w),
                                    ),
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        //print("Icon press");
                                        context.router
                                            .push(const TournamentRoute());
                                      },
                                      child: Icon(
                                        Icons.arrow_right_alt,
                                        size: p1.maxWidth * 0.1,
                                        color: const Color(0xffFBF9FF),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          titleTextStyle: TextStyle(
                            fontSize: 15.w,
                            //color: const Color(0xff474448),
                            color: const Color(0xffFF6978),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w900,
                          ),
                          subtitleTextStyle: TextStyle(
                            fontSize: sSize == ScreenSize.phone ||
                                    sSize == ScreenSize.tab
                                ? 9.w
                                : 6.6.w,
                            fontFamily: 'Cabin',
                            color: const Color(0xff253237),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const _PlayWithFriendTile(),
      ],
      options: CarouselOptions(
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        enlargeFactor: 0.24,
        padEnds: false,
        // disableCenter: true,
        viewportFraction:
            sSize == ScreenSize.phone || sSize == ScreenSize.tab ? 0.81 : 0.9,
      ),
    );
  }
}

class _PlayWithFriendTile extends StatelessWidget {
  const _PlayWithFriendTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 150.h,
      //margin: EdgeInsets.symmetric(horizontal: 9.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: const Color(0xffa3d9ff),
        borderRadius: BorderRadius.circular(6.w),
      ),
      padding: EdgeInsets.all(6.w),
      child: LayoutBuilder(
        builder: (_, p1) => Row(
          children: [
            Flexible(
              child: Lottie.asset('assets/friends_joystick.json'),
            ),
            SizedBox(width: 15.w),
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 0.9,
                child: FittedBox(
                  child: AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Play with\n",
                          style: TextStyle(
                            fontSize: p1.maxWidth * 0.025,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff17255A),
                          ),
                        ),
                        TextSpan(
                          text: "Friends",
                          style: TextStyle(
                            fontSize: p1.maxWidth * 0.05,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Montserrat',
                            color: const Color(0xff18206F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
