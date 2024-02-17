import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import 'package:toggle_switch/toggle_switch.dart';

import '../dashboard/open_challenge_table.dart';
import '../logic/my_names.dart';
import '../theme/my_color.dart';

@RoutePage()
class ViewLeaderBoardPage extends ConsumerWidget {
  const ViewLeaderBoardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isMoreSize = 900.h / 360.w > 2.3;
    final i = mockInteger(1, 10);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 90.h,
        titleSpacing: 0,
        backgroundColor: ghostWhite1,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ToggleSwitch(
            totalSwitches: 2,
            //changeOnTap: false,
            labels: const ["Last Played", "All time"],
            minHeight: 72.h,
            minWidth: 150.w,
            customWidths: [165.w, 135.w],
            //onToggle: (index) =>
            //    ref.read(levelProvider.notifier).state = RoomLevel.values[index!],
            inactiveBgColor: ghostWhite1,
            inactiveFgColor: frenchGray,

            activeBgColor: const [ghostWhite1],
            activeFgColor: richBlack,
            animate: false,
            animationDuration: 150,
            dividerColor: coolGray,
            dividerMargin: 0.3.r,
            customTextStyles: [
              TextStyle(
                fontFamily: 'Poppins',
                fontSize: 27.r,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: List.generate(
              15,
              (index) => AnimatedContainer(
                    height: 81.h,
                    margin: EdgeInsets.only(bottom: 1.5.r),
                    //color: cornellRed,
                    color: i == index ? lightOrange : ghostWhite1,
                    alignment: Alignment.center,
                    duration: const Duration(milliseconds: 500),
                    child: ListTile(
                      leading: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        alignment: Alignment.centerLeft,
                        width: isMoreSize ? 90.w : 81.w,
                        height: 45.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedFlipCounter(
                              value: mockInteger(1, 999),
                              wholeDigits: 3,
                              duration: const Duration(milliseconds: 1200),
                              textStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 13.5.r,
                                color: frenchGray,
                                letterSpacing: 0.3.r,
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: isMoreSize ? 1 : 0.9,
                              child: CircleAvatar(
                                backgroundColor: majorelleBlue,
                                child: RandomAvatar(mockString()),
                              ),
                            )
                          ],
                        ),
                      ),
                      titleTextStyle: TextStyle(
                        fontSize: 15.r,
                        fontFamily: 'Montserrat',
                        height: 1.5,
                        color: gray,
                      ),
                      contentPadding: EdgeInsets.only(left: 15.w, right: 9.w),
                      subtitleTextStyle: TextStyle(
                        fontSize: 9.r,
                        color: gray,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                      ),
                      title: Text(myRandomName(), maxLines: 1),
                      subtitle: const Text("11 December 2024"),
                      trailing: Container(
                        alignment: Alignment.centerLeft,
                        width: isMoreSize ? 120.w : 108.w,
                        height: 45.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: isMoreSize ? 9.r : 12.r,
                              backgroundColor: xantHous,
                              child: Icon(Icons.star, size: 12.r),
                            ),
                            ShowPlayedDuration(
                              Duration(
                                  milliseconds: mockInteger(100000, 900000)),
                              true,
                              color: federalBlue,
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
