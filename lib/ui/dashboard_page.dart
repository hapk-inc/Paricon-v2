import 'package:auto_route/annotations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/auth.dart';
import '../logic/user_datastore.dart';
import '../my_widgets/dashboard_app_bar.dart';
import '../my_widgets/my_list_tile.dart';
import '../my_widgets/my_logo.dart';
import '../my_widgets/my_names.dart';
import 'package:random_avatar/random_avatar.dart';
import '../logic/s_size.dart';

import 'dashboard/dashboard_iPad.dart';
import 'dashboard/dashboard_phone.dart';
import 'dashboard/dashboard_tab.dart';
import 'dashboard/dashboard_tv.dart';
import 'dashboard/dashboard_web.dart';

@RoutePage()
class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);

    return Scaffold(
      appBar: dashboardAppBar(sSize),
      backgroundColor: const Color(0xfffbf9ff),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: sSize == ScreenSize.phone
              ? const DashboardP()
              : sSize == ScreenSize.tab
                  ? const DashboardT()
                  : sSize == ScreenSize.iPad
                      ? const DashboardIpad()
                      : sSize == ScreenSize.pc
                          ? const DashboardW()
                          : const DashboardTV(),
        ),
      ),
    );
  }
}

class DashboardDrawer extends ConsumerWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserProvider).value;

    return Drawer(
      width: 240.w,
      backgroundColor: Colors.deepPurple.shade700,
      elevation: 4,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: myUser == null
            ? Container()
            : Column(
                children: [
                  Container(
                    //color: Colors.white70,
                    height: 120.h,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: CircleAvatar(
                            radius: 45.h,
                            backgroundColor: Colors.deepPurple.shade100,
                            child:
                                RandomAvatar(myUser.avatar, trBackground: true),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: 75.h,
                            //color: Colors.black54,
                            width: 150.w,
                            padding: EdgeInsets.only(left: 12.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: AutoSizeText(
                                    myUser.name,
                                    minFontSize: 12,
                                    maxFontSize: 15,
                                    style: TextStyle(
                                      color: Colors.deepPurple.shade100,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                AutoSizeText(
                                  myRandomName(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.deepPurple.shade200),
                                  minFontSize: 6,
                                  maxFontSize: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 0.5.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepPurple.shade200,
                          Colors.deepPurple.shade200,
                          Colors.deepPurple.shade400,
                          Colors.deepPurple,
                        ].reversed.toList(),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                  ),
                  const Space20(),
                  const Space20(),
                  SizedBox(
                    //color: Colors.white70,
                    height: 60.h,
                    child: ListTile(
                      tileColor: Colors.white54,
                      leading: const Icon(Icons.home),
                      title: AutoSizeText(
                        "Dashboard",
                        style: TextStyle(
                          color: Colors.deepPurple.shade700,
                          fontWeight: FontWeight.w700,
                        ),
                        minFontSize: 9,
                        maxFontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    //color: Colors.white70,
                    height: 60.h,
                    child: ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.deepPurple.shade200,
                      ),
                      title: AutoSizeText(
                        "Settings",
                        style: TextStyle(
                          color: Colors.deepPurple.shade200,
                          fontWeight: FontWeight.w700,
                        ),
                        minFontSize: 9,
                        maxFontSize: 12,
                      ),
                    ),
                  ),
                  Divider(color: Colors.deepPurple.shade400),
                  SizedBox(
                    //color: Colors.white70,
                    height: 60.h,
                    child: ListTile(
                      leading: Icon(
                        Icons.notification_important,
                        color: Colors.deepPurple.shade200,
                      ),
                      title: AutoSizeText(
                        "Alerts",
                        style: TextStyle(
                          color: Colors.deepPurple.shade200,
                          fontWeight: FontWeight.w700,
                        ),
                        minFontSize: 9,
                        maxFontSize: 12,
                      ),
                    ),
                  ),
                  Divider(color: Colors.deepPurple.shade400),
                  SizedBox(
                    //color: Colors.white70,
                    height: 60.h,
                    child: ListTile(
                      onTap: () => ref.read(signOutProvider),
                      leading: Icon(
                        Icons.exit_to_app,
                        color: Colors.deepPurple.shade200,
                      ),
                      title: AutoSizeText(
                        "Log out",
                        style: TextStyle(
                          color: Colors.deepPurple.shade200,
                          fontWeight: FontWeight.w700,
                        ),
                        minFontSize: 9,
                        maxFontSize: 12,
                      ),
                    ),
                  ),
                  Divider(color: Colors.deepPurple.shade400),
                  //Spacer(),
                  const Space20(),
                  const Space20(),
                  const Space20(),
                  // Space20(),
                  // Space20(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AutoSizeText.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Gather your wit and "
                                "join me in a friendly competition to"
                                " determine who among us is the ",
                          ),
                          TextSpan(
                            text: "sharpest.",
                            style: TextStyle(
                              color: Colors.deepPurple.shade50,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      style: TextStyle(
                        color: Colors.deepPurple.shade300,
                        fontWeight: FontWeight.w100,
                      ),
                      maxFontSize: 10,
                      minFontSize: 8,
                      maxLines: 4,
                    ),
                  ),
                  Expanded(
                      child: SizedBox(height: 240.h, child: const MyLogo())),
                ],
              ),
      ),
    );
  }
}
