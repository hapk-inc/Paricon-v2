import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/auth/bloc.dart';
import '../logic/user/bloc.dart';
import '../model/player.dart';
import '../values/colors.dart';
import 'my_theme.dart';
import 'settings/log_out_option.dart';
import 'package:group_button/group_button.dart';

final SlidingPanelTheme _pTheme = SlidingPanelTheme();
final Logger _logger = Logger();

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double appH = Theme.of(context).appBarTheme.toolbarHeight ?? 120.h;
    final User? user = ref.read(authUserProvider).value;
    final Player? player = ref.watch(meProvider).value;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final DateTime now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: appH * 0.75,
        leadingWidth: 60.w,
        leading: IconButton(
          iconSize: 24.r,
          color: magnolia,
          onPressed: () => context.router.maybePop(),
          icon: const Icon(Icons.chevron_left),
        ),
        titleSpacing: 0,
        title: const Text("Settings"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "EDIT PROFILE",
              style: TextStyle(color: magnolia),
            ),
          )
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: player == null
            ? Container()
            : SlidingUpPanel(
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
                                      borderRadius:
                                          BorderRadius.circular(7.5.r),
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
                          child: Center(
                            child:
                                Text(player.name, style: textTheme.titleLarge),
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
                        ),
                        const StaggeredGridTile.count(
                          crossAxisCellCount: 15,
                          mainAxisCellCount: 1.2,
                          child: SizedBox(),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 15,
                          // mainAxisCellCount: 2.1,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(left: 7.5.w),
                            child: GroupButton(
                              controller:
                                  GroupButtonController(selectedIndex: 0),
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
                                textPadding:
                                    EdgeInsets.symmetric(horizontal: 15.w),
                                unselectedColor: lavender,
                                selectedColor: majorelleBlue,
                                borderRadius: BorderRadius.circular(4.8.r),
                                buttonHeight: 36.h,
                                unselectedTextStyle: textTheme.headlineSmall
                                    ?.copyWith(color: magnolia1),
                                selectedTextStyle: textTheme.headlineSmall
                                    ?.copyWith(color: ghostWhite),
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
              ),
      ),
    );
  }
}
