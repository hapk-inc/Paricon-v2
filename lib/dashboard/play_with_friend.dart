import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import '../logic/dashboard_panel_provider.dart';
import '../logic/panel_provider.dart';

import '../logic/remote_values.dart';
import '../theme/my_color.dart';
import '../ui/game_room.dart';

class PlayWithFriend extends ConsumerWidget {
  const PlayWithFriend({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tTheme = Theme.of(context).textTheme;
    final bool goToPlayOnline = ref.watch(showPlayOnlineProvider);
    final dNotifier = ref.watch(dashboardPanelNotifierProvider);
    double aR = (900.h / 360.w);

    return StaggeredGridTile.fit(
      crossAxisCellCount: 20,
      child: SizedBox(
        height: 240.h,
        child: Stack(
          children: [
            Container(
              height: 150.h,
              margin: EdgeInsets.all(4.5.r),
              decoration: BoxDecoration(
                color: jasper,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15.r),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: SizedBox(height: 36.h),
                subtitle: AutoSizeText(
                  "Connect with your friends",
                  style: tTheme.bodySmall!.copyWith(color: magnolia),
                  minFontSize: 9,
                  maxFontSize: 12,
                  maxLines: 1,
                ),
              ),
            ),
            Positioned(
              left: 60.r,
              right: 60.r,
              top: -15.r,
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: !goToPlayOnline
                    ? () => ScaffoldMessenger.of(context)
                        .showSnackBar(_stillInProgress)
                    : () {
                        dNotifier.dWidget = const CreateGameRoom();
                        dNotifier.dHeight = aR > 2.3 ? 300.h : 270.h;
                        ref.read(dashboardPanelProvider).open();
                      },
                child: Lottie.asset('lottie/friends-playing.json'),
              ),
            ),
            Container(
              height: 150.h,
              margin: EdgeInsets.all(4.5.r),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15.r),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                isThreeLine: true,
                title: SizedBox(
                  height: 36.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                        child: AutoSizeText(
                          "Play with Friends",
                          style: tTheme.bodyMedium!.copyWith(color: magnolia),
                          maxLines: 1,
                        ),
                      ),
                      Gap(6.r),
                    ],
                  ),
                ),
                subtitle: AutoSizeText(
                  "",
                  style: tTheme.bodySmall!.copyWith(color: magnolia),
                  minFontSize: 9,
                  maxFontSize: 12,
                  maxLines: 1,
                ),
                trailing: ElevatedButton(
                  onPressed: !goToPlayOnline
                      ? () => ScaffoldMessenger.of(context)
                          .showSnackBar(_stillInProgress)
                      : () {
                          dNotifier.dWidget = const CreateGameRoom();
                          dNotifier.dHeight = aR > 2.3 ? 300.h : 270.h;
                          ref.read(dashboardPanelProvider).open();
                        },
                  child: const Text("PLAY NOW"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

SnackBar get _stillInProgress => SnackBar(
      backgroundColor: richBlack,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.only(left: 15.r),
      margin: EdgeInsets.only(bottom: 30.h, left: 4.5.w, right: 4.5.w),
      content: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 48.h,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        child: AutoSizeText(
          "Under construction. Appreciate your patience",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12.r,
            color: ghostWhite,
            fontWeight: FontWeight.normal,
          ),
          maxLines: 1,
          minFontSize: 12,
          maxFontSize: 15,
        ),
      ),
    );
