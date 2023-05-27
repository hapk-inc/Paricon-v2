import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';

import 'package:random_avatar/random_avatar.dart';

import '../logic/s_size.dart';
import '../logic/user_datastore.dart';
import 'my_list_tile.dart';
import 'my_logo.dart';

AppBar myAppBar(ScreenSize size, BuildContext context, {double? leadingWidth}) {
  switch (size) {
    case ScreenSize.phone:
      return AppBar(
        toolbarHeight: 100.h,
        //leadingWidth: 60,
        /*leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Consumer(
            builder: (context, ref, child) {
              final myUserAsync = ref.watch(myUserProvider);
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: myUserAsync.when(
                  data: (data) => InkWell(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.deepPurple.shade50,
                      child: RandomAvatar(data.avatar, trBackground: true),
                    ),
                  ),
                  error: (error, stackTrace) => Container(),
                  loading: () => Container(),
                ),
              );
            },
          ),
        ),*/
        leading: Container(),
        leadingWidth: 0,
        centerTitle: true,
        backgroundColor: const Color(0xff724cf9),
        title: AnimatedPadding(
          duration: const Duration(milliseconds: 500),
          padding: EdgeInsets.all(900.h / 360.w > 2
              ? 4.0
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
