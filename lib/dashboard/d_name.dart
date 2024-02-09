import 'package:animate_do/animate_do.dart';
import 'package:animated_emoji/animated_emoji.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:gap/gap.dart';
import 'package:paricon/theme/my_color.dart';

import '../logic/dashboard_panel_provider.dart';
import '../logic/panel_provider.dart';
import '../my_widget/change_name.dart';

class DName extends ConsumerWidget {
  final String name;
  const DName(this.name, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DashboardPanelNotifier dNotifier =
        ref.watch(dashboardPanelNotifierProvider);

    return StaggeredGridTile.fit(
      crossAxisCellCount: 20,
      child: SlideInLeft(
        child: FadeIn(
          child: Container(
            height: 30.h,
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left: 15.w),
            child: Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 150.w),
                  child: AutoSizeText(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Gap(12.r),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      dNotifier.dHeight = 192.h;
                      dNotifier.dWidget = const ChangeName();
                      ref.read(dashboardPanelProvider).open();
                    },
                    child: AnimatedEmoji(
                      AnimatedEmojis.pencil,
                      size: 30.r,
                      repeat: true,
                      animate: true,
                      onLoaded: (duration) {},
                      errorWidget: Icon(
                        Icons.edit,
                        size: 30.r,
                        color: federalBlue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
