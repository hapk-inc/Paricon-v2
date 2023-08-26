import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../logic/dot_notifier.dart';
import '../../logic/s_size.dart';
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

    print(sSize);

    final isTab = sSize == ScreenSize.tab;
    final isPhone = sSize == ScreenSize.phone;
    final isPad = sSize == ScreenSize.iPad;
    final isPC = sSize == ScreenSize.pc;

    return DefaultTabController(
      length: 2,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 15.h),
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: isPC
                ? 180.h
                : isPad
                    ? 165.h
                    : 135.h,
            margin: EdgeInsets.only(bottom: 15.h),
            //padding: EdgeInsets.only(left: 9.w),
            alignment: Alignment.centerLeft,
            //color: Colors.blue,
            child: TabBarView(
              controller: _tabController,
              children: [
                EngageAndUnlock(
                  tFontSize: isPC ? 15 : 24,
                  subFontSize: isPC ? 6 : 13.5,
                ),
                const NameDOB(),
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoginButton(
                    txtSize: isPhone ? 13.2 : 13.5,
                    hMargin: isPC
                        ? 3
                        : isPhone
                            ? 9
                            : 6),
                LoginDot(
                    bigR: isPhone
                        ? 9
                        : isPC
                            ? 6
                            : 9,
                    smallR: isPhone
                        ? 7.5
                        : isPC
                            ? 4.5
                            : 8.1),
              ],
            ),
          ),
          AnimatedContainer(
            margin: EdgeInsets.symmetric(vertical: 4.5.h),
            duration: const Duration(seconds: 5),
            alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: isPhone
                  ? 1.05
                  : isTab
                      ? 1.35
                      : isPC
                          ? 1.44
                          : 1,
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
                    child: Lottie.asset('assets/profile_mobile.json',
                        repeat: true),
                  )
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: EdgeInsets.only(top: 15.h),
            child: AlreadyExisting(
                txtSize: isPhone
                    ? 13.5
                    : isTab
                        ? 12
                        : isPad
                            ? 10.5
                            : isPC
                                ? 6
                                : 7.5),
          )
        ],
      ),
    );
  }
}
