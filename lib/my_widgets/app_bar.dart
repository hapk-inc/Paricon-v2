import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import '../my_widgets/my_names.dart';

import 'package:random_avatar/random_avatar.dart';

import '../logic/s_size.dart';
import '../logic/user_datastore.dart';
import 'my_list_tile.dart';
import 'my_logo.dart';

AppBar myAppBar(ScreenSize size, BuildContext context, {double? leadingWidth}) {
  switch (size) {
    case ScreenSize.phone:
      return AppBar(
        elevation: 4,
        backgroundColor: Colors.deepPurpleAccent.shade700,
        flexibleSpace: const Opacity(opacity: 0.1, child: MyLogo()),
        leading: Padding(
          padding: EdgeInsets.only(left: 9.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 36.h,
                child: AutoSizeText(
                  myRandomName(),
                  style: const TextStyle(
                      color: Color(0xfffde8e9),
                      //fontWeight: FontWeight.w100,
                      fontFamily: 'Poppins'),
                  maxFontSize: 15,
                  minFontSize: 9,
                  maxLines: 1,
                ),
              ),
              SizedBox(height: 3.h),
              SizedBox(
                height: 18.h,
                child: const AutoSizeText(
                  "Hope you have a great day",
                  style: TextStyle(
                    color: Color(0xfffde8e9),
                    fontWeight: FontWeight.w100,
                  ),
                  maxFontSize: 9,
                  minFontSize: 6,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 240.w,
        toolbarHeight: 95.h,
        titleSpacing: 0,
        title: SizedBox(
          //color: Colors.blue,
          width: 81.w,
          height: 96.h,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                bottom: -10.h,
                left: 10.w,
                height: 105.h,
                width: 90.w,
                child: RandomAvatar(
                  mockString(),
                  trBackground: true,
                ),
              ),
            ],
          ),
        ),
      );

    case ScreenSize.tab:
      return AppBar(
        toolbarHeight: 120.h,
        backgroundColor: Colors.deepPurpleAccent.shade700,
        leadingWidth: 210.w,
        leading: SizedBox(width: 210.w, child: const MyLogo()),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.w),
            child: Consumer(
              builder: (context, ref, child) {
                final myUserAvatar = ref.watch(myUserProvider).when(
                      data: (data) => data.avatar,
                      error: (error, stackTrace) => mockString(),
                      loading: () => mockString(),
                    );

                return CircleAvatar(
                  backgroundColor: Colors.deepPurple.shade100,
                  radius: 20.w,
                  child: RandomAvatar(myUserAvatar, trBackground: true),
                );
              },
            ),
          )
        ],
      );

    case ScreenSize.pc:
      return AppBar(
        toolbarHeight: 120.h,
        backgroundColor: Colors.deepPurpleAccent.shade700,
        leadingWidth: 300,
        leading: const MyLogo(),
        actions: <Widget>[Container()],
        centerTitle: false,
        title: Consumer(
          builder: (context, ref, child) {
            final myUser = ref.watch(myUserProvider).value;
            if (myUser == null) return Container();
            return FadeInRight(
              child: SizedBox(
                width: 360.w * 0.4,
                height: 120.h,
                child: MyListTile(
                  leading: RandomAvatar(myUser.avatar, trBackground: true),
                  title: "Welcome ${myUser.name}",
                ),
              ),
            );
          },
        ),
      );

    case ScreenSize.tv:
      return AppBar(
        toolbarHeight: 120.h,
        backgroundColor: Colors.deepPurpleAccent.shade700,
        leadingWidth: 100.w,
        leading: const MyLogo(),
        actions: <Widget>[Container()],
        centerTitle: false,
        title: SizedBox(
          width: 360.w * 0.4,
          height: 120.h,
          child: Consumer(
            builder: (context, ref, child) {
              final myUser = ref.watch(myUserProvider).value;
              if (myUser == null) return Container();
              return FadeInRight(
                child: MyListTile(
                  leading: RandomAvatar(myUser.avatar, trBackground: true),
                  title: "Welcome ${myUser.name}",
                ),
              );
            },
          ),
        ),
      );
    case ScreenSize.tooSmall:
      return AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.deepPurpleAccent.shade700,
        title: SizedBox(width: 270.w, child: const MyLogo()),
      );
  }
}

AppBar phone1 = AppBar(
  toolbarHeight: 95.h,
  leading: Container(),
  leadingWidth: 0,
  centerTitle: true,
  backgroundColor: const Color(0xff724cf9),
  title: AnimatedPadding(
    duration: const Duration(milliseconds: 500),
    padding: EdgeInsets.all(900.h / 360.w > 2
        ? 6.0
        : 900.h / 360.w > 1.7
            ? 8.0
            : 900.h / 360.h < 1.6
                ? 16.0
                : 32.0),
    child: FadeInDown(
      delay: const Duration(seconds: 1),
      child: const MyLogo(),
    ),
  ),
  elevation: 8,
);
