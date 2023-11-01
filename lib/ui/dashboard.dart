import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../logic/s_size.dart';
import '../../theme/my_color.dart';
import '../logic/dashboard_provider.dart';
import '../logic/firebase_init.dart';
import '../logic/remote_values.dart';
import '../my_widget/no_internet_panel.dart';
import '../theme/my_theme.dart';
import 'dashboard_widget/d_body_state.dart';
import 'dashboard_widget/d_work_in_progress.dart';

@RoutePage()
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize sSize = ref.read(sizeProvider);

    final SlidingPanelTheme pTheme = SlidingPanelTheme();

    final Widget panelWidget = ref.watch(internetConnectionProvider).when(
        data: (connectionResult) => connectionResult == ConnectivityResult.none
            ? const NoInternetPanel()
            : Container(),
        error: (_, __) => Container(),
        loading: () => Container());

    final PanelController dPanelController = ref.watch(dashboardPanelProvider);

    ref.listen(
      internetConnectionProvider.select((value) => value.value),
      (previous, next) {
        debugPrint("$next");
        if (next != null) {
          debugPrint("40-connection-$next");
          bool noNet = next == ConnectivityResult.none;
          if (noNet) {
            if (dPanelController.isPanelClosed) {
              dPanelController.open();
            }
          } else {
            if (dPanelController.isPanelOpen) {
              dPanelController.close();
            }
          }
        }
      },
    );

    return Scaffold(
      backgroundColor: ghostWhite,
      drawerEnableOpenDragGesture: false,
      body: SlidingUpPanel(
        controller: dPanelController,
        panel: panelWidget,
        isDraggable: false,
        backdropColor: richBlack,
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
            : const DashboardBodyState(),
      ),
    );
  }
}

/*
* Certainly, here are five variations of the message for first-time users in your app:

"Hello, new user! You've unlocked a fresh avatar. Simply click here to set it as your profile picture."

"Welcome, newcomer! Congratulations on earning a new avatar. To make it your profile picture, just click here."

"Hey there, first-time user! You've got a brand-new avatar waiting. Click here to give it a spin as your profile pic."

"Greetings, newbie! A shiny new avatar is yours to claim. To make it your profile image, click right here."

"Hello to our newest user! You've earned a cool new avatar. To use it as your profile picture, just click here."*/
