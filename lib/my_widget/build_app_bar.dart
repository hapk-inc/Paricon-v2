import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../logic/dashboard_provider.dart';
import '../logic/s_size.dart';
import '../logic/user_datastore.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';
import 'my_logo.dart';

AppBar buildAppBar(ScreenSize sSize, BuildContext context) {
  switch (sSize) {
    case ScreenSize.phone:
      return AppBar(
        backgroundColor: majorelleBlue,
        toolbarHeight: 90.h,
        leading: Container(
          margin: EdgeInsets.only(left: 9.r),
          child: const MyLogo(),
        ),
        leadingWidth: 270.r,
        elevation: 9,
        actions: [
          Consumer(
            builder: (_, ref, __) {
              final MyUser? myUser = ref.watch(myUserProvider).value;
              final panelController = ref.read(dashboardPanelProvider);
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: myUser == null
                    ? Container()
                    : AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        margin: EdgeInsets.only(
                            right: myUser.avatar.isEmpty ? 0.r : 9.r,
                            bottom: 3.r),
                        padding:
                            EdgeInsets.all(myUser.avatar.isEmpty ? 3.r : 0.r),
                        child: InkWell(
                          onTap: () {
                            if (!panelController.isPanelOpen) {
                              panelController.open();
                            } else {
                              panelController.close();
                            }
                          },
                          child: myUser.avatar.isEmpty
                              ? Lottie.asset(
                                  Random().nextBool()
                                      ? 'lottie/b_female_01.json'
                                      : 'lottie/b_male_01.json',
                                )
                              : CircleAvatar(
                                  radius: 27.r,
                                  child: CircleAvatar(
                                    radius: 24.r,
                                    child: RandomAvatar(myUser.avatar),
                                  ),
                                ),
                        ),
                      ),
              );
            },
          ),
        ],
      );
    default:
      return AppBar();
  }
}
