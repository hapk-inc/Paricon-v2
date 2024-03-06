import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mock_data/mock_data.dart';

import 'package:random_avatar/random_avatar.dart';
import '../logic/auth_provider.dart';
import '../logic/my_names.dart';
import '../logic/s_size.dart';
import '../theme/my_color.dart';

import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../theme/my_theme.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme tTheme = Theme.of(context).textTheme;
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final SlidingPanelTheme pTheme = SlidingPanelTheme();
    final ScreenSize screenSize = ref.watch(sizeProvider);
    final User? user = ref.watch(authUserProvider).value;

    final String userName = myUser?.name ?? mockAvatarName();
    final String userAvatar = myUser?.avatar ?? "";
    final String mockEmail = "${mockAvatarName()}@gmail.com".toLowerCase();
    final String email =
        (user?.isAnonymous ?? true) ? mockEmail : (user?.email ?? mockEmail);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60.w,
        titleSpacing: 0,
        toolbarHeight: 90.h,
        centerTitle: false,
        title: Text(
          "Settings",
          style: tTheme.bodyMedium!.copyWith(
            color: ghostWhite1,
            fontFamily: 'Montserrat',
            fontSize: 24.r,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 21,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 21,
                mainAxisCellCount: 6,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: 48.r,
                    backgroundColor: magnolia,
                    child: userAvatar.isEmpty
                        ? Text(
                            userName.substring(0, 2).toUpperCase(),
                            style: TextStyle(
                              fontSize: 30.r,
                              fontFamily: 'WendyOne',
                              color: chocolateCosmos,
                              letterSpacing: 0.9.r,
                            ),
                          )
                        : RandomAvatar(userAvatar, trBackground: true),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 21,
                mainAxisCellCount: 6,
                child: ListTile(
                  dense: true,
                  title: Text(
                    userName,
                    style: TextStyle(fontSize: 24.r),
                    textAlign: TextAlign.center,
                  ),
                  titleTextStyle: tTheme.bodySmall?.copyWith(
                    fontFamily: 'WendyOne',
                    color: federalBlue,
                  ),
                  /*subtitleTextStyle: tTheme.bodySmall?.copyWith(
                    fontFamily: 'Montserrat',
                    color: frenchGray,
                    height: 0,
                  ),*/
                  titleAlignment: ListTileTitleAlignment.center,
                  subtitle: Text(
                    email,
                    style: TextStyle(
                      fontSize: 12.r,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      color: coyote,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 21,
                mainAxisCellCount: 4.8,
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "30",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 24.r,
                                height: 2.1.r,
                                color: vanDyke,
                              ),
                            ),
                            Text(
                              "Tournaments",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.r,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(),
                    Flexible(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "30",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 24.r,
                                height: 2.1.r,
                                color: vanDyke,
                              ),
                            ),
                            Text(
                              "All-time Record",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.r,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(),
                    Flexible(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "30",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 24.r,
                                height: 2.1.r,
                                color: vanDyke,
                              ),
                            ),
                            Text(
                              "Cards",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.r,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const StaggeredGridTile.count(
                  crossAxisCellCount: 21,
                  mainAxisCellCount: 4.5,
                  child: SizedBox()),
              if (kDebugMode || Platform.isIOS)
                StaggeredGridTile.count(
                  crossAxisCellCount: 21,
                  mainAxisCellCount: 2.4,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => ref.read(deleteAccountProvider),
                      child: Text(
                        "DELETE MY ACCOUNT",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: cornellRed,
                          fontSize: 15.r,
                        ),
                      ),
                    ),
                  ),
                ),
              StaggeredGridTile.count(
                crossAxisCellCount: 21,
                mainAxisCellCount: 2.4,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () => ref.read(signOutProvider),
                    child: Text(
                      "LOG OUT",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: gray,
                          fontSize: 15.r),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
