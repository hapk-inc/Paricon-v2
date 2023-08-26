import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../logic/dot_notifier.dart';
import '../../logic/s_size.dart';

/*class LoginP extends ConsumerStatefulWidget {
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
                LoginDot(
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
}*/

import '../login/already_existing.dart';
import '../login/dot_indicator.dart';
import '../login/engage_and_unlock.dart';
import '../login/l_button.dart';
import '../login/name_dob.dart';

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
    ref.listen(
      dotNotifierProvider,
      (previous, next) {
        debugPrint(next.toString());
        _tabController.animateTo(next);
      },
    );

    final sSize = ref.read(sizeProvider);
    final isTab = sSize == ScreenSize.tab;
    final isPhone = sSize == ScreenSize.phone;
    final isPad = sSize == ScreenSize.iPad;

    return LayoutBuilder(
      builder: (_, p1) => DefaultTabController(
        length: 2,
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: p1.maxWidth * 0.03, vertical: p1.maxHeight * 0.012),
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: p1.maxHeight * 0.27,
              padding: EdgeInsets.only(left: p1.maxWidth * 0.015),
              alignment: Alignment.centerLeft,
              //color: Colors.blue,
              child: TabBarView(
                children: [
                  EngageAndUnlock(
                    tFontSize: p1.maxWidth *
                        (isPhone
                            ? 0.105
                            : isTab
                                ? 0.108
                                : isPad
                                    ? 0.081
                                    : 0.066),
                    subFontSize: p1.maxWidth *
                        (isPhone
                            ? 0.048
                            : isTab
                                ? 0.048
                                : isPad
                                    ? 0.039
                                    : 0.03),
                  ),
                  const NameDOB(),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: EdgeInsets.only(top: p1.maxHeight * 0.015),
              //padding: EdgeInsets.only(left: 12.w, right: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LoginButton(
                    txtSize: p1.maxWidth *
                        (isPhone
                            ? 0.048
                            : isTab
                                ? 0.048
                                : 0.03),
                    hMargin: p1.maxWidth *
                        (isPhone
                            ? 0.0012
                            : isTab
                                ? 0
                                : 0.03),
                  ),
                  LoginDot(
                    bigR: p1.maxWidth * (isPhone ? 0.054 : 0.048),
                    smallR: p1.maxWidth * (isPhone ? 0.036 : 0.033),
                    space: p1.maxWidth * (isPhone ? 0.036 : 0.036),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              margin: EdgeInsets.symmetric(vertical: 4.5.h),
              duration: const Duration(seconds: 5),
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: isPhone
                    ? 1
                    : isTab
                        ? 1
                        : 0.8,
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
              margin: EdgeInsets.only(top: p1.maxHeight * 0.012),
              child: AlreadyExisting(
                txtSize: p1.maxWidth * (isPhone ? 0.051 : 0.048),
              ),
            )
          ],
        ),
      ),
    );
  }
}
