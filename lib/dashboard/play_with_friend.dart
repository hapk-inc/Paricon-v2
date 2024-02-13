import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 150.h,
            decoration: const BoxDecoration(color: jasper),
            alignment: Alignment.center,
            child: ListTile(
              title: AutoSizeText(
                "Play with Friends",
                style: tTheme.bodyMedium!.copyWith(color: magnolia),
                maxLines: 1,
              ),
              subtitle: Text(
                "Connect with your friends",
                style: tTheme.bodySmall!.copyWith(color: magnolia),
                //minFontSize: 9,
                //maxFontSize: 12,
                maxLines: 1,
              ),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text("PLAY NOW"),
              ),
            ),
          ),
          Positioned(
            width: 240.w,
            right: 45.w,
            child: InkWell(
              onTap: !goToPlayOnline
                  ? () => ScaffoldMessenger.of(context)
                      .showSnackBar(_stillInProgress)
                  : () {
                      dNotifier.dWidget = const CreateGameRoom();
                      dNotifier.dHeight = aR > 2.3 ? 300.h : 270.h;
                      ref.read(dashboardPanelProvider).open();
                    },
              child: Lottie.asset(
                'lottie/friends-playing.json',
                alignment: Alignment.bottomCenter,
              ),
            ),
          )
        ],
      ),
    );
  }
}

SnackBar get _stillInProgress => SnackBar(
      margin: EdgeInsets.only(bottom: 30.h, left: 4.5.w, right: 4.5.w),
      content: const Text(
        "Under construction. Appreciate your patience",
        maxLines: 1,
      ),
    );
