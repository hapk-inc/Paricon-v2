import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/app/device_provider.dart';
import '../logic/auth/bloc.dart';
import '../logic/user/bloc.dart';
import '../model/player.dart';
import '../values/colors.dart';
import 'my_theme.dart';
import 'settings/log_out_dialog.dart';

import 'settings/setting_tile.dart';

final SlidingPanelTheme _pTheme = SlidingPanelTheme();

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final double appH = Theme.of(context).appBarTheme.toolbarHeight ?? 120.h;
    final Player? player = ref.watch(meProvider).value;
    final AppBarTheme appBarTheme = Theme.of(context).appBarTheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: (appBarTheme.toolbarHeight ?? 120.h) * 0.75,
        leadingWidth: 60.w,
        iconTheme: IconThemeData(
          color: magnolia1,
          size: appBarTheme.iconTheme?.size ?? 18.r,
        ),
        titleSpacing: 0,
        title: const Text("Profile"),
      ),
      body: player == null ? Container() : const _Settings(),
    );
  }
}

class _Settings extends ConsumerWidget {
  const _Settings();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final User? user = ref.read(authUserProvider).value;

    final String str = DateFormat.yMMMMd()
        .format(user?.metadata.creationTime ?? DateTime.now());

    final String email = user?.email ?? "${mockString()}@gmail.com";

    final Player? me = ref.watch(meProvider).value;

    final String version = ref.watch(packageInfoProvider).maybeWhen(
          orElse: () => "",
          data: (app) => "${app.version} (${app.buildNumber})",
        );

    return SafeArea(
      bottom: false,
      child: SlidingUpPanel(
        borderRadius: _pTheme.slidingPanelRadius,
        backdropEnabled: true,
        color: _pTheme.slidingPanelColor,
        maxHeight: 360.r,
        defaultPanelState: PanelState.CLOSED,
        padding: _pTheme.slidingPanelPadding,
        isDraggable: false,
        minHeight: 0,
        panel: Container(),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: ListTile(
                  contentPadding: EdgeInsets.all(15.r),
                  isThreeLine: true,
                  title: CircleAvatar(radius: 48.r, backgroundColor: magnolia),
                  subtitle: Column(
                    children: [
                      Gap(15.r),
                      Text(
                        me?.name ?? "",
                        style: textTheme.titleMedium?.copyWith(
                          color: majorelleBlue,
                        ),
                      ),
                      Gap(7.5.r),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            email,
                            style: const TextStyle(color: tropicalIndigo),
                          ),
                          const VerticalDivider(),
                          Text(
                            str,
                            style: const TextStyle(color: tropicalIndigo),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  color: magnolia1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...[
                        SettingsTile("Edit profile", tileTap: () {}),
                        SettingsTile("Notifications", tileTap: () {}),
                        SettingsTile(
                          "Invite People and get a new avatar",
                          tileTap: () {},
                        ),
                        SettingsTile("Statistics", tileTap: () {}),
                      ],
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.all(15.r),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              version,
                              style: textTheme.headlineMedium
                                  ?.copyWith(color: frenchGray),
                            ),
                            Gap(12.r),
                            CircleAvatar(
                              radius: 3.r,
                              backgroundColor: frenchGray,
                            ),
                            Gap(12.r),
                            Text(
                              "Privacy Policy",
                              style: textTheme.headlineMedium
                                  ?.copyWith(color: frenchGray),
                            ),
                            Gap(12.r),
                            CircleAvatar(
                              radius: 3.r,
                              backgroundColor: frenchGray,
                            ),
                            Gap(12.r),
                            InkWell(
                              onTap: () => showDialog(
                                context: context,
                                builder: (_) => const LogOutDialog(),
                              ),
                              child: Text(
                                "LOG OUT",
                                style: textTheme.headlineMedium
                                    ?.copyWith(color: jasper, height: 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(
                        (Theme.of(context).appBarTheme.toolbarHeight ?? 135.h) *
                            1.35,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class _SettingP extends ConsumerWidget {
  const _SettingP();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.read(authUserProvider).value;

    final TextTheme textTheme = Theme.of(context).textTheme;
    final DateTime now = DateTime.now();
    final Player? player = ref.watch(meProvider).value;

    return SlidingUpPanel(
      minHeight: 0,
      panel: Container(),
      borderRadius: _pTheme.slidingPanelRadius,
      color: _pTheme.slidingPanelColor,
      maxHeight: 240.h,
      defaultPanelState: PanelState.CLOSED,
      padding: _pTheme.slidingPanelPadding * 1.5,
      isDraggable: false,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 7.5.w),
          child: StaggeredGrid.count(
            crossAxisCount: 15,
            children: [
              Gap(7.5.r),
              StaggeredGridTile.fit(
                crossAxisCellCount: 15,
                child: SizedBox(
                  height: 180.h,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        bottom: 30.h,
                        child: Container(
                          decoration: BoxDecoration(
                            color: majorelleBlue,
                            borderRadius: BorderRadius.circular(7.5.r),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          radius: 60.r,
                          backgroundColor: ghostWhite,
                          child: CircleAvatar(radius: 54.r),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              StaggeredGridTile.fit(
                crossAxisCellCount: 15,
                child: ListTile(
                  title: ListTile(
                    tileColor: ghostWhite,
                    title: AutoSizeText(
                      player?.name ?? "",
                      style: textTheme.titleMedium?.copyWith(color: violetBlue),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd()
                        .format(user?.metadata.creationTime ?? now),
                    style:
                        textTheme.bodyMedium?.copyWith(color: tropicalIndigo),
                    textAlign: TextAlign.center,
                    //maxLines: 2,
                  ),
                ),
              ),
              */
/*StaggeredGridTile.fit(
                          crossAxisCellCount: 15,
                          child: Center(
                            child:
                                Text(player.name, style: textTheme.titleMedium),
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 15,
                          child: Center(
                            child: Text(
                              DateFormat.yMMMMd()
                                  .format(user?.metadata.creationTime ?? now),
                              style: textTheme.bodySmall,
                              // style: textTheme.bodySmall,
                            ),
                          ),
                        ),*/ /*

              StaggeredGridTile.count(
                crossAxisCellCount: 15,
                mainAxisCellCount: 1.2.r,
                child: const SizedBox(),
              ),
              StaggeredGridTile.fit(
                crossAxisCellCount: 15,
                // mainAxisCellCount: 2.1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 7.5.w),
                  child: GroupButton(
                    controller: GroupButtonController(selectedIndex: 0),
                    isRadio: true,
                    onSelected: (str, index, isSelected) =>
                        _logger.i('$index button is selected'),
                    maxSelected: 1,
                    buttons: const [
                      "OPEN CHALLENGE",
                      "AVATAR PASS",
                      //"PLAY WITH FRIENDS",
                    ],
                    options: GroupButtonOptions(
                      mainGroupAlignment: MainGroupAlignment.start,
                      spacing: 7.5.w,
                      textPadding: EdgeInsets.symmetric(horizontal: 15.w),
                      unselectedColor: lavender,
                      selectedColor: majorelleBlue,
                      borderRadius: BorderRadius.circular(4.8.r),
                      buttonHeight: 36.h,
                      unselectedTextStyle:
                          textTheme.headlineSmall?.copyWith(color: magnolia1),
                      selectedTextStyle:
                          textTheme.headlineSmall?.copyWith(color: ghostWhite),
                      //unselectedTextStyle: TextStyle(fontSize: 15.r)
                      //crossGroupAlignment: CrossGroupAlignment.start,
                      //groupRunAlignment: GroupRunAlignment.start,
                    ),
                  ),
                ),
              ),
              const StaggeredGridTile.count(
                crossAxisCellCount: 15,
                mainAxisCellCount: 1.05,
                child: SizedBox(),
              ),
              StaggeredGridTile.fit(
                crossAxisCellCount: 15,
                child: Container(height: 120.h, color: lavender),
              ),
              const StaggeredGridTile.count(
                crossAxisCellCount: 15,
                mainAxisCellCount: 0.72,
                child: SizedBox(),
              ),
              const LogoutOption(),
            ],
          ),
        ),
      ),
    );
  }
}
*/
