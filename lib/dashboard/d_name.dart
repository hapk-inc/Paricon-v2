import 'package:animated_emoji/animated_emoji.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gap/gap.dart';
import '../logic/dashboard_provider.dart';
import '../logic/next_animation_flag.dart';
import '../logic/panel_provider.dart';
import '../model/my_user.dart';
import '../my_widget/change_name.dart';
import '../theme/my_color.dart';

import '../logic/dashboard_panel_provider.dart';
import '../logic/user_provider.dart';

class DName extends ConsumerWidget {
  const DName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final DashboardPanelNotifier dNotifier =
        ref.watch(dashboardPanelNotifierProvider);
    final tTheme = Theme.of(context).textTheme;
    final repeatAnimationNotifier = ref.watch(repeatAnimationNotifierProvider);

    return ListTile(
      contentPadding: EdgeInsets.only(left: 15.w),
      title: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 2410.w),
            child: AutoSizeText(
              myUser?.name ?? "",
              style: tTheme.bodyMedium!.copyWith(color: violetBlue),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Gap(15.r),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              //onTap: () => context.router.push(const SettingsRoute()),
              onTap: () {
                dNotifier.dHeight = 192.h;
                dNotifier.dWidget = const ChangeName();
                ref.read(dashboardPanelProvider).open();
              },
              child: AnimatedEmoji(
                AnimatedEmojis.pencil,
                size: 30.r,
                repeat: repeatAnimationNotifier.repeatAnimation,
                animate: repeatAnimationNotifier.repeatAnimation,
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
      dense: true,
      subtitleTextStyle: tTheme.bodySmall,
      subtitle: Text(
        ref.read(goodDayProvider),
        maxLines: 1,
        style: TextStyle(fontSize: 12.r),
      ),
    );
  }
}
