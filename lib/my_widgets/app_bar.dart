import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mock_data/mock_data.dart';

import 'package:random_avatar/random_avatar.dart';

import '../logic/s_size.dart';
import '../theme/my_color.dart';
import 'my_logo.dart';

AppBar buildAppBar(ScreenSize sSize) {
  switch (sSize) {
    case ScreenSize.phone:
      return AppBar(
        backgroundColor: darkCyan,
        toolbarHeight: 88.5.h,
        leading: Container(
          margin: EdgeInsets.only(left: 9.r),
          child: const MyLogo(),
        ),
        leadingWidth: 255.r,
        elevation: 9,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 9.r),
            child: CircleAvatar(
              radius: 27.r,
              child: CircleAvatar(
                radius: 24.r,
                child: RandomAvatar(mockString()),
              ),
            ),
          ),
        ],
      );
    case ScreenSize.tab:
      return AppBar(
        toolbarHeight: 87.h,
        leading: Container(
          margin: EdgeInsets.only(left: 9.r),
          child: const MyLogo(),
        ),
        leadingWidth: 255.r,
        elevation: 9,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15.r),
            child: CircleAvatar(
              radius: 27.r,
              child: CircleAvatar(
                radius: 24.r,
                child: RandomAvatar(mockString()),
              ),
            ),
          ),
        ],
      );
    case ScreenSize.iPad:
      return AppBar(
        toolbarHeight: 105.h,
        titleSpacing: 9.r,
        leading: Container(
          margin: EdgeInsets.only(left: 9.r),
          child: const MyLogo(),
        ),
        leadingWidth: 281.r,
        centerTitle: false,
        elevation: 9,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 45.r),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.bell,
                color: lavenderBush,
                size: 27.r,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 15.r),
            child: CircleAvatar(
              radius: 30.r,
              child: CircleAvatar(
                radius: 27.r,
                child: RandomAvatar(mockString()),
              ),
            ),
          ),
        ],
      );
    case ScreenSize.pc:
      return AppBar(
        toolbarHeight: 105.h,
        titleSpacing: 9.w,
        leading: Container(
          margin: EdgeInsets.only(left: 15.r),
          child: const MyLogo(),
        ),
        leadingWidth: 300.r,
        centerTitle: false,
        title: Container(
          height: 105.h,
          // color: spaceCadet,
          alignment: Alignment.centerLeft,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "CREATE GAME",
                    style: TextStyle(
                      color: lavenderBush,
                      fontSize: 16.r,
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
              VerticalDivider(
                width: 45.r,
                color: lavenderBush,
                endIndent: 24.r,
                indent: 24.r,
              ),
              Flexible(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "ENTER ROOM CODE",
                    maxLines: 2,
                    style: TextStyle(color: lavenderBush, fontSize: 16.r),
                  ),
                ),
              ),
            ],
          ),
        ),
        elevation: 9,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 30.r),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.bell,
                color: lavenderBush,
                size: 30.r,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 30.r),
            child: CircleAvatar(
              radius: 30.r,
              child: CircleAvatar(
                radius: 27.r,
                child: RandomAvatar(mockString()),
              ),
            ),
          ),
        ],
      );
    case ScreenSize.tv:
      return AppBar(
        toolbarHeight: 105.h,
        leading: Container(
          margin: EdgeInsets.only(left: 15.r),
          child: const MyLogo(),
        ),
        titleSpacing: 60.r,
        centerTitle: false,
        title: Container(
          width: 120.w,
          height: 96.h,
          //color: barnRed,
          alignment: Alignment.centerLeft,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "CREATE GAME",
                  style: TextStyle(color: lavenderBush),
                ),
              ),
              VerticalDivider(
                width: 60.r,
                color: lavenderBush,
                endIndent: 24.r,
                indent: 24.r,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "ENTER ROOM CODE",
                  style: TextStyle(color: lavenderBush),
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 300.r,
        elevation: 9,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 30.r),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.bell,
                color: lavenderBush,
                size: 30.r,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 30.r),
            child: CircleAvatar(
              radius: 30.r,
              child: CircleAvatar(
                radius: 27.r,
                child: RandomAvatar(mockString()),
              ),
            ),
          ),
        ],
      );
    case ScreenSize.tooSmall:
      return AppBar();
    default:
      return AppBar();
  }
}

/*AppBar myAppBar(ScreenSize size, BuildContext context, {double? leadingWidth}) {
  var appbarTab = AppBar(
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
  var appbarWeb = AppBar(
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
  var appBarTv = AppBar(
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
  switch (size) {
    case ScreenSize.phone:
      return AppBar(
        elevation: 4,
        //backgroundColor: Colors.deepPurpleAccent.shade700,
        backgroundColor: const Color(0xff724cf9),
        flexibleSpace: const Opacity(opacity: 0.1, child: MyLogo()),
        leading: Padding(
          padding: EdgeInsets.only(left: 9.w),
          child: LayoutBuilder(
            builder: (context, p1) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: SizedBox(
                    height: p1.maxHeight * 0.325,
                    child: const FittedBox(
                      child: AutoSizeText(
                        "Playing Daily Tournament",
                        style: TextStyle(
                            color: Color(0xfffde8e9),
                            //fontWeight: FontWeight.w100,
                            fontFamily: 'Poppins'),
                        maxFontSize: 15,
                        minFontSize: 9,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Flexible(
                  child: SizedBox(
                    height: p1.maxHeight * 0.175,
                    child: const FittedBox(
                      child: AutoSizeText(
                        "For the first time",
                        style: TextStyle(
                          color: Color(0xfffde8e9),
                          fontWeight: FontWeight.w100,
                        ),
                        maxFontSize: 9,
                        minFontSize: 6,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                bottom: -6.h,
                left: 0.w,
                height: 90.h,
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
      return appbarTab;
    case ScreenSize.iPad:
      return appbarTab;

    case ScreenSize.pc:
      return appbarWeb;

    case ScreenSize.tv:
      return appBarTv;
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
);*/
