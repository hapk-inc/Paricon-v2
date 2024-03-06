import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/my_names.dart';

import '../dashboard/open_challenge_table.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

@RoutePage()
class ViewTournamentPage extends ConsumerWidget {
  const ViewTournamentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        title: const Text(
          "Tournament",
          style: TextStyle(fontFamily: 'WendyOne', color: ghostWhite1),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(15.r),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: const AutoSizeText(
                  "Enter tournament code to register for the tournament.",
                  style: TextStyle(color: vanDyke),
                  maxLines: 2,
                ),
              ),
              Gap(30.r),
              Container(
                decoration: BoxDecoration(
                  color: magnolia,
                  borderRadius: BorderRadius.circular(7.5.r),
                ),
                height: 90.h,
                alignment: Alignment.center,
                // margin: EdgeInsets.symmetric(horizontal: 15.w),
                padding: EdgeInsets.symmetric(horizontal: 7.5.r),
                child: const TournamentTextField(),
              ),
              Gap(30.r),
              AspectRatio(
                aspectRatio: 0.96,
                child: Container(
                  padding: EdgeInsets.only(left: 15.w),
                  alignment: Alignment.centerLeft,
                  child: CarouselSlider(
                    items: const [
                      TournamentCarouselSlide(),
                      //TournamentCarouselSlide(),
                    ],
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      aspectRatio: 0.96,
                      viewportFraction: 0.81,
                      padEnds: false,
                    ),
                  ),
                ),
              ),
              Gap(30.r),
              const OpenChallengeTable()
            ],
          ),
        ),
      ),
    );
  }
}

class TournamentTextField extends StatelessWidget {
  const TournamentTextField({super.key});

  @override
  Widget build(BuildContext context) => TextFormField(
        maxLines: 1,
        cursorColor: chocolateCosmos,
        cursorHeight: 30.r,
        cursorWidth: 1.2.r,
        keyboardType: TextInputType.name,
        autocorrect: false,
        style: TextStyle(
          color: federalBlue,
          fontSize: 21.r,
          height: 2.1,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.12.r,
        ),
        decoration: InputDecoration(
          hintText: 'Enter the tournament code',
          contentPadding: EdgeInsets.fromLTRB(3.w, 0, 0, 12.h),
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            letterSpacing: 0,
            fontSize: 15.r,
            color: gray,
            fontWeight: FontWeight.w300,
          ),
          isDense: true,
          isCollapsed: false,
        ),
      );
}

class TournamentCarouselSlide extends StatelessWidget {
  const TournamentCarouselSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final panelTheme = SlidingPanelTheme();
    final tTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: federalBlue,
        borderRadius: panelTheme.slidingPanelFullRadius * 1.8,
      ),
      margin: EdgeInsets.only(right: 15.w),
      padding: panelTheme.slidingPanelPadding * 0.75,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60.h,
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: null,
                  label: Text(
                    "Online",
                    style: tTheme.bodySmall?.copyWith(
                      color: ghostWhite1,
                      fontSize: 15.r,
                    ),
                  ),
                  icon: Icon(Icons.circle, size: 21.r, color: emerald),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(ghostWhite1),
                  ),
                  child: const AutoSizeText(
                    "Play Game",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: federalBlue,
                    ),
                  ),
                )
              ],
            ),
          ),
          Gap(7.5.r),
          const SizedBox.square(
            dimension: 150,
            child: FlutterLogo(),
          ),
          Gap(15.r),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Text(
              "Zepto",
              style: tTheme.bodyMedium?.copyWith(
                fontFamily: 'Montserrat',
                color: ghostWhite1,
                height: 2.1.r,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Text(
              "${mockAvatarName()}, ${mockAvatarName()} are playing",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 12.r,
                color: ghostWhite1,
                height: 1.5.r,
              ),
            ),
          ),
          Gap(24.r),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                Icon(Icons.timer, size: 21.r, color: ghostWhite1),
                Gap(4.5.w),
                Text(
                  "Mar 21",
                  style: tTheme.bodySmall?.copyWith(
                    color: frenchGray,
                    fontSize: 15.r,
                  ),
                ),
                Gap(30.w),
                Icon(Icons.group, size: 21.r, color: ghostWhite1),
                Gap(4.5.w),
                Text(
                  "${mockInteger(1, 10)}",
                  style: tTheme.bodySmall?.copyWith(
                    color: frenchGray,
                    fontSize: 15.r,
                  ),
                ),
                Gap(30.w),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share, size: 21.r, color: frenchGray),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
