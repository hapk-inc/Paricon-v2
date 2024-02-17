import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paricon/theme/my_color.dart';
import 'package:toggle_switch/toggle_switch.dart';

@RoutePage()
class ViewLeaderBoardPage extends ConsumerWidget {
  const ViewLeaderBoardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            customWidths: [150.w, 120.w],
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
    );
  }
}
