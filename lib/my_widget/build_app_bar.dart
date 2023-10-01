import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/s_size.dart';
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
          /*Container(
            margin: EdgeInsets.only(right: 9.r),
            child: Consumer(
              builder: (_, ref, __) => InkWell(
                onTap: () => ref.read(signOutProvider),
                child: CircleAvatar(
                  radius: 27.r,
                  child: CircleAvatar(
                    radius: 24.r,
                    child: RandomAvatar(mockString()),
                  ),
                ),
              ),
            ),
          ),*/
        ],
      );
    default:
      return AppBar();
  }
}
