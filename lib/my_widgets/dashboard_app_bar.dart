import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/auth.dart';
import '../logic/s_size.dart';
import 'my_logo.dart';

AppBar dashboardAppBar(ScreenSize size) {
  switch (size) {
    case ScreenSize.phone:
      return AppBar(
        toolbarHeight: 84.h,
        leading: const MyLogo(),
        actions: [
          Consumer(
            builder: (context, ref, child) => Container(
              margin: EdgeInsets.only(right: 15.w),
              child: InkWell(
                onTap: () => ref.read(signOutProvider),
                child: CircleAvatar(
                  radius: 21.sp,
                  backgroundColor: const Color(0xffEFB7FF),
                  child: RandomAvatar(mockString(), trBackground: true),
                ),
              ),
            ),
          )
        ],
        leadingWidth: 210.w,
      );

    case ScreenSize.tab:
      return AppBar(
        //backgroundColor: Colors.green,
        toolbarHeight: 84.h,
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
}
