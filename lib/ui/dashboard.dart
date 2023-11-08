import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../d_widget/d_card_collection.dart';
import '../d_widget/d_carousel.dart';
import '../d_widget/d_panel.dart';
import '../d_widget/d_recent_player.dart';
import '../d_widget/d_welcome.dart';
import '../d_widget/d_work_in_progress.dart';
import '../logic/auth_provider.dart';
import '../logic/firebase_init.dart';
import '../logic/panel_provider.dart';
import '../logic/remote_values.dart';
import '../logic/s_size.dart';
import '../my_widget/my_logo.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

@RoutePage()
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PanelController controller = ref.watch(dashboardPanelProvider);

    ref.listen(
      internetConnectionProvider.select((value) => value.value),
      (previous, next) {
        Future.delayed(
          const Duration(seconds: 2),
          () {
            if (controller.isPanelOpen) {
              controller.close();
            }
            bool prevConnected = previous == ConnectivityResult.mobile ||
                previous == ConnectivityResult.wifi;
            if (next == ConnectivityResult.none && prevConnected) {
              if (controller.isPanelClosed) {
                controller.open();
              }
            }
          },
        );
      },
    );

    return const DashboardState();
  }
}

class DashboardState extends ConsumerWidget {
  const DashboardState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize sSize = ref.read(sizeProvider);
    final SlidingPanelTheme pTheme = SlidingPanelTheme();

    return Scaffold(
      backgroundColor: ghostWhite,
      drawerEnableOpenDragGesture: false,
      body: SlidingUpPanel(
        controller: ref.watch(dashboardPanelProvider),
        panel: const DashboardPanel(),
        isDraggable: false,
        backdropColor: pTheme.backDrop,
        backdropEnabled: true,
        backdropOpacity: 0.9,
        borderRadius: pTheme.slidingPanelRadius,
        minHeight: 0,
        maxHeight: pTheme.slidingPanelHeight,
        body: sSize == ScreenSize.phone ? const DashboardP() : Container(),
      ),
    );
  }
}

class DashboardP extends ConsumerWidget {
  const DashboardP({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String inWork = ref.watch(inWorkProvider);
    return SafeArea(
      bottom: false,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: (inWork.isNotEmpty && !kDebugMode)
            ? DashboardWorkInProgress(inWork: inWork)
            : const DashboardStaggered(),
      ),
    );
  }
}

class DashboardStaggered extends ConsumerWidget {
  const DashboardStaggered({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 20,
          mainAxisSpacing: 1.r,
          crossAxisSpacing: 1.r,
          children: [
            const StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 8.4,
              child: DWelcome(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 5.4.r,
              child: const RecentPlayer(),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 15,
              child: DashCarousel(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 21.r,
              child: const DCardCollection(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 9.r,
              child: Container(
                padding: EdgeInsets.all(7.5.r),
                alignment: Alignment.center,
                child: Opacity(
                  opacity: 0.9,
                  child: InkWell(
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text("Click here to log out"),
                        backgroundColor: charcoal,
                        action: SnackBarAction(
                          label: 'CONFIRM',
                          onPressed: () => ref.read(signOutProvider),
                        ),
                      ),
                    ),
                    child: const MyLogo(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
