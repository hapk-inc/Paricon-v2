import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/s_size.dart';
import '../my_widgets/my_logo.dart';
import '../theme/my_color.dart';
import 'login/login_p.dart';
import 'login/login_pad.dart';
import 'login/login_web.dart';

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.watch(sizeProvider);
    final isPhoneTab = sSize == ScreenSize.phone || sSize == ScreenSize.tab;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: !isPhoneTab ? majorelleBlue : null,
      appBar: isPhoneTab
          ? AppBar(
              backgroundColor: sSize == ScreenSize.tab ? sunGlow : null,
              toolbarHeight: 84.h,
              leadingWidth: leadingWidthSize(sSize),
              leading: const MyLogo(),
              elevation: 9,
            )
          : null,
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: sSize == ScreenSize.phone || sSize == ScreenSize.tab
              ? const LoginP()
              : sSize == ScreenSize.iPad
                  ? const LoginPad()
                  : sSize == ScreenSize.pc || sSize == ScreenSize.tv
                      ? const LoginWeb()
                      : const Placeholder(),
        ),
      ),
    );
  }

  double leadingWidthSize(ScreenSize sSize) => sSize == ScreenSize.phone
      ? 210.w
      : sSize == ScreenSize.tab
          ? 195.w
          : sSize == ScreenSize.iPad
              ? 150.w
              : sSize == ScreenSize.pc || sSize == ScreenSize.tv
                  ? 198
                  : 0;
}

/*AppBar dashboardAppBar(ScreenSize size) {
  switch (size) {
    case ScreenSize.phone:
      return AppBar(
        toolbarHeight: 90.h,
        leading: const MyLogo(),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15.w),
            child: CircleAvatar(
              radius: 21.sp,
              backgroundColor: const Color(0xffEFB7FF),
              child: RandomAvatar(mockString(), trBackground: true),
            ),
          )
        ],
        leadingWidth: 210.w,
      );

    case ScreenSize.tab:
      return AppBar(
        //backgroundColor: Colors.green,
        toolbarHeight: 90.h,
        leading: const MyLogo(),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15.w),
            child: CircleAvatar(
              radius: 18.sp,
              backgroundColor: const Color(0xffEFB7FF),
              child: RandomAvatar(mockString(), trBackground: true),
            ),
          )
        ],
        leadingWidth: 180.w,
      );
    case ScreenSize.iPad:
      return AppBar(
        toolbarHeight: 90.h,
        leading: const MyLogo(),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15.w),
            child: CircleAvatar(
              radius: 18.sp,
              backgroundColor: const Color(0xffEFB7FF),
              child: RandomAvatar(mockString(), trBackground: true),
            ),
          )
        ],
        leadingWidth: 150.w,
      );
    case ScreenSize.pc:
      return AppBar(
        leadingWidth: 225,
        toolbarHeight: 105.h,
        leading: const MyLogo(),
        actions: [
          Consumer(
            builder: (_, ref, __) => Container(
              margin: EdgeInsets.symmetric(horizontal: 9.w),
              child: InkWell(
                onTap: () => ref.read(signOutProvider),
                child: const Icon(Icons.notifications),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 9.w),
            child: const Icon(Icons.info),
          ),
        ],
        actionsIconTheme: const IconThemeData(size: 21),
      );
    case ScreenSize.tv:
      return AppBar(
        leadingWidth: 90.h,
        leading: const MyLogo(),
      );
    case ScreenSize.tooSmall:
      return AppBar(
        toolbarHeight: 100.h,
      );
  }
}*/
