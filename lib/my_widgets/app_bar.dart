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

AppBar myAppBar(ScreenSize size, {double? leadingWidth}) {
  switch (size) {
    case ScreenSize.phone:
      return AppBar(
        toolbarHeight: 100.h,
        leading: Container(),
        leadingWidth: 0.w,
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent.shade700,
        title: SizedBox(width: 270.w, child: const MyLogo()),
        /*actions: [
          Consumer(
            builder: (__, ref, _) {
              return IconButton(
                onPressed: () {
                  ref.read(signOutProvider);
                },
                icon: Icon(Icons.exit_to_app),
              );
            },
          )
        ],*/
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
