import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../theme/my_color.dart';

class MyBottomBar extends ConsumerWidget {
  const MyBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(4.5.r)),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: ToggleSwitch(
          animate: true,
          animationDuration: 200,
          cornerRadius: 0,

          minHeight: 54.h,
          //initialLabelIndex: _currentPage,
          initialLabelIndex: 0,
          activeBgColor: const [majorelleBlue],
          inactiveBgColor: periwinkle,
          customWidths: [120.w, 132.w, 108.w],
          totalSwitches: 3,
          labels: const ['Tournament', 'Card Collection', 'My Profile'],
          customTextStyles: [
            TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14.r,
              color: ghostWhite,
              fontWeight: FontWeight.w700,
            ),
          ],
          onToggle: (int? index) {
            if (index != null) {
              //_pageController.animateToPage(index,
              //    duration: const Duration(milliseconds: 500),
              //    curve: Curves.easeInOut);
              // _pageController.jumpToPage(index);
              // setState(() => _currentPage = index);
            }
          },
        ),
      ),
    );
  }
}
