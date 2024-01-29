import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/auth_provider.dart';
import '../logic/firebase_init.dart';
import '../logic/panel_provider.dart';
import '../logic/s_size.dart';
import '../logic/user_activity_provider.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize screenSize = ref.read(sizeProvider);
    final bool isPhone = screenSize == ScreenSize.phone;
    final SlidingPanelTheme slidingPanelTheme = SlidingPanelTheme();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: majorelleBlue,
        titleSpacing: 0,
        iconTheme: IconThemeData(color: ghostWhite, size: 24.r),
        centerTitle: false,
        toolbarHeight: 75.h,
        titleTextStyle: TextStyle(
          fontFamily: 'WendyOne',
          fontSize: 24.r,
          letterSpacing: 0.3.r,
        ),
        title: const AutoSizeText(
          "Settings",
          style: TextStyle(color: ghostWhite),
        ),
      ),
      backgroundColor: ghostWhite,
      body: SlidingUpPanel(
        controller: ref.watch(settingPanelProvider),
        minHeight: 0.h,
        maxHeight: 300.h,
        borderRadius: slidingPanelTheme.slidingPanelRadius,
        backdropEnabled: true,
        panel: Container(),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: !isPhone ? Container() : const SettingsState(),
        ),
      ),
    );
  }
}

class SettingsState extends ConsumerWidget {
  const SettingsState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tTheme = Theme.of(context).textTheme;
    final pTheme = SlidingPanelTheme();
    return SafeArea(
      minimum: pTheme.slidingPanelPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Gap(7.5.r),
          ListTile(
            iconColor: jasper,
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 9.6.r,
            dense: true,
            onTap: () {
              ref.read(setActiveProvider(false));
              ref.read(signOutProvider);
            },
            leading: Icon(Icons.logout, size: 30.r),
            title: Container(
              height: 45.h,
              alignment: Alignment.centerLeft,
              child: Text(
                "Log Out",
                style: tTheme.bodyMedium!.copyWith(
                  fontSize: 21.r,
                  color: jasper,
                ),
              ),
            ),
            trailing: Icon(Icons.chevron_right, color: jasper, size: 30.r),
          ),
          ref.watch(packageInfoProvider).maybeWhen(
                orElse: () => Container(),
                data: (app) => Text(
                  "Version ${app.version} (${app.buildNumber})",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: gray,
                        fontWeight: FontWeight.w300,
                        fontSize: 12.r,
                      ),
                ),
              ),
        ],
      ),
    );
  }
}
