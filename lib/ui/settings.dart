import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../values/colors.dart';
import 'settings/log_out_dialog.dart';
import 'settings/setting_tile.dart';

BorderRadius get _iconRadius => BorderRadius.circular(4.5.r);

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: magnolia,
      appBar: AppBar(
        toolbarHeight: 75.h,
        backgroundColor: magnolia,
        elevation: 0,
        title: const Text("Settings", style: TextStyle(color: charcoal)),
        // centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(15.r),
            Text(
              "General",
              style: textTheme.headlineLarge?.copyWith(color: charcoal),
            ),
            Gap(24.r),
            Container(
              decoration: BoxDecoration(
                color: ghostWhite,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 7.5.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Column(
                  children: [
                    SettingsTile(
                      onTap: () {},
                      title: 'Account',
                      leading: SizedBox.square(
                        dimension: 30.r,
                        child: Container(
                          decoration: BoxDecoration(
                            color: uranianBlue,
                            borderRadius: _iconRadius,
                          ),
                          child: Icon(Icons.person, size: 18.r),
                        ),
                      ),
                    ),
                    SettingsTile(
                      onTap: () {},
                      title: 'Notifications',
                      leading: SizedBox.square(
                        dimension: 30.r,
                        child: Container(
                          decoration: BoxDecoration(
                            color: naplesYellow,
                            borderRadius: _iconRadius,
                          ),
                          child: Icon(Icons.notifications, size: 18.r),
                        ),
                      ),
                    ),
                    SettingsTile(
                      onTap: () {},
                      title: 'Statistics',
                      leading: SizedBox.square(
                        dimension: 30.r,
                        child: Container(
                          decoration: BoxDecoration(
                            color: aquamarine,
                            borderRadius: _iconRadius,
                          ),
                          child: Icon(Icons.bar_chart, size: 18.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(30.r),
            Text(
              "More Settings",
              style: textTheme.headlineLarge?.copyWith(color: charcoal),
            ),
            Gap(24.r),
            Container(
              decoration: BoxDecoration(
                color: ghostWhite,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 7.5.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Column(
                  children: [
                    SettingsTile(
                      onTap: () {},
                      title: 'Privacy Policy',
                      leading: SizedBox.square(
                        dimension: 30.r,
                        child: Container(
                          decoration: BoxDecoration(
                            color: thistle,
                            borderRadius: _iconRadius,
                          ),
                          child: Icon(Icons.policy, size: 18.r),
                        ),
                      ),
                    ),
                    SettingsTile(
                      onTap: () => showDialog(
                        context: context,
                        builder: (_) => const LogOutDialog(),
                      ),
                      title: 'Log Out',
                      leading: SizedBox.square(
                        dimension: 30.r,
                        child: Container(
                          decoration: BoxDecoration(
                            color: cherryBlossomPink,
                            borderRadius: _iconRadius,
                          ),
                          child: Icon(Icons.logout, size: 18.r),
                        ),
                      ),
                    ),
                    SettingsTile(
                      onTap: () {},
                      title: 'Deactivate Account',
                      leading: SizedBox.square(
                        dimension: 30.r,
                        child: Container(
                          decoration: BoxDecoration(
                            color: jasper,
                            borderRadius: _iconRadius,
                          ),
                          child: Icon(
                            Icons.delete,
                            size: 18.r,
                            color: ghostWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
