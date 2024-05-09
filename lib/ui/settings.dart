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
        toolbarHeight: 60.h,
        backgroundColor: magnolia,
        elevation: 0,
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView(
          children: [
            Gap(15.r),
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
                    SettingTile(
                      onTap: () {},
                      name: 'Account',
                      icon: Icons.person,
                    ),
                    SettingTile(
                      onTap: () {},
                      name: 'Notifications',
                      icon: Icons.notifications,
                    ),
                    SettingTile(
                      onTap: () {},
                      name: 'Statistics',
                      icon: Icons.bar_chart,
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
                    SettingTile(
                      onTap: () {},
                      name: 'Privacy Policy',
                      icon: Icons.policy,
                    ),
                    SettingTile(
                      onTap: () => showDialog(
                        context: context,
                        builder: (_) => const LogOutDialog(),
                      ),
                      name: 'Logout',
                      icon: Icons.logout,
                    ),
                    SettingTile(
                      onTap: () {},
                      name: 'Deactivate Account',
                      icon: Icons.delete,
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
