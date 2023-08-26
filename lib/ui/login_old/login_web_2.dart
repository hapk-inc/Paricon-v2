import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:paricon/logic/s_size.dart';

import '../../logic/dot_notifier.dart';

import '../login/dot_indicator.dart';
import '../login/engage_and_unlock.dart';
import '../login/l_button.dart';
import '../login/name_dob.dart';

class LoginWeb extends ConsumerWidget {
  const LoginWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    final bool isTV = sSize == ScreenSize.tv;
    final double ar = 900.h / 360.w;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: isTV ? Colors.indigo : const Color(0xff724cf9),
      alignment: Alignment.center,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: ar > 0.9
            ? 240.w
            : isTV
                ? 240.w
                : 300.w,
        height: ar > 0.9 ? 810.h : 540.h,
        child: Card(
          elevation: 9,
          child: AnimatedPadding(
            padding: EdgeInsets.symmetric(horizontal: isTV ? 4.5.w : 3.w),
            duration: const Duration(milliseconds: 200),
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: ar > 0.9 ? Container() : const _LoginW()),
          ),
        ),
      ),
    );
  }
}

class _LoginW extends ConsumerStatefulWidget {
  const _LoginW();

  @override
  ConsumerState createState() => __LoginWState();
}

class __LoginWState extends ConsumerState<_LoginW>
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
    print(sSize);
    final isTV = sSize == ScreenSize.tv;
    return Row(
      children: [
        Flexible(
          flex: 4,
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(4.5.sp),
                      child: EngageAndUnlock(
                        tFontSize: isTV ? 7.5 : 9.75,
                        subFontSize: isTV ? 4.5 : 6,
                      ),
                    ),
                    const NameDOB()
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  // color: Colors.blue,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LoginButton(
                        txtSize: isTV ? 3 : 4.8,
                        hMargin: isTV ? 1.2 : 0.6,
                        borderRadius: isTV ? 1.2 : 1.5,
                      ),
                      LoginDot(
                        bigR: isTV ? 4.5 : 5.4,
                        smallR: isTV ? 3 : 3.6,
                        space: isTV ? 3.6 : 3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        VerticalDivider(
          indent: 15.h,
          endIndent: 15.h,
          color: const Color(0xff724cf9).withOpacity(0.3),
        ),
        Flexible(
          flex: 3,
          child: FractionallySizedBox(
            widthFactor: isTV ? 0.9 : 1,
            heightFactor: isTV ? 0.9 : 1,
            child: Container(
              // color: Colors.green,
              alignment: Alignment.center,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Lottie.asset('assets/jigsaw_green.json'),
                  Lottie.asset('assets/profile_mobile.json'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
