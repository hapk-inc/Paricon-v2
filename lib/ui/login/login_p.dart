import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../logic/dot_notifier.dart';
import '../../logic/s_size.dart';
import 'already_existing.dart';
import 'dot_indicator.dart';
import 'engage_and_unlock.dart';
import 'l_button.dart';
import 'name_dob.dart';

class LoginP extends ConsumerStatefulWidget {
  const LoginP({super.key});

  @override
  ConsumerState createState() => _LoginPState();
}

class _LoginPState extends ConsumerState<LoginP>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(dotNotifierProvider, (previous, next) {
      debugPrint(next.toString());
      _tabController.animateTo(next);
    });
    final sSize = ref.read(sizeProvider);
    final isTab = sSize == ScreenSize.iPad;
    final isPhone = sSize == ScreenSize.phone;
    //final dot = ref.watch(dotNotifierProvider);
    return DefaultTabController(
      length: 2,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
        children: [
          AnimatedContainer(
            height: isTab
                ? 180.h
                : isPhone
                    ? 156.h
                    : 165.h,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(left: 7.5.w),
            duration: const Duration(milliseconds: 500),
            child: TabBarView(
              controller: _tabController,
              children: [
                const EngageAndUnlock(),
                NameDOB(
                    hintSize: isTab
                        ? 9
                        : isPhone
                            ? 12
                            : 9.6),
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: EdgeInsets.symmetric(vertical: 15.h),
            padding: EdgeInsets.only(left: 12.w, right: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoginButton(
                  txtSize: isTab
                      ? 8.4
                      : !isPhone
                          ? 9.9
                          : 12,
                  hMargin: isTab
                      ? 6
                      : !isPhone
                          ? 8.1
                          : 9,
                ),
                LoginDots(
                  bigR: isTab ? 8.1 : 12,
                  smallR: isTab ? 7.2 : 9.6,
                  space: isTab ? 8.4 : 9,
                ),
              ],
            ),
          ),
          AnimatedContainer(
            margin: EdgeInsets.symmetric(vertical: 4.5.h),
            duration: const Duration(seconds: 5),
            alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: isTab
                  ? 1
                  : isPhone
                      ? 1
                      : 1.2,
              child: TabBarView(
                controller: _tabController,
                children: [
                  FadeIn(
                    child: Lottie.asset(
                      'assets/jigsaw_green.json',
                      repeat: true,
                    ),
                  ),
                  FadeIn(
                    child: Lottie.asset(
                      'assets/profile_mobile.json',
                      repeat: true,
                    ),
                  )
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: EdgeInsets.only(top: 15.h),
            child: AlreadyExisting(txtSize: isTab ? 10.5 : null),
          )
        ],
      ),
    );
  }
}
