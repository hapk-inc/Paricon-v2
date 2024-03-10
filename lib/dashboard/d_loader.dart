import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../logic/app_check.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../logic/panel_provider.dart';
import '../../theme/my_color.dart';
import '../logic/firebase_init.dart';

class DLoader extends ConsumerStatefulWidget {
  final String s;
  const DLoader(this.s, {super.key});

  @override
  ConsumerState createState() => _RecentPlayerLoaderState();
}

class _RecentPlayerLoaderState extends ConsumerState<DLoader> {
  late PanelController dashboardPanel;

  @override
  void initState() {
    super.initState();
    dashboardPanel = ref.read(dashboardPanelProvider);

    final nNotifier = netConnectedNotifierProvider.notifier;
    //ref.watch(nNotifier).state = 0;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (mounted) {
          ref.watch(remoteConfigProvider).fetchAndActivate().then(
            (value) {
              ref.watch(nNotifier).state = value ? 1 : 0;
            },
          ).catchError(
            (e, __) {
              final FirebaseException exe = e as FirebaseException;
              debugPrint("40--");
              //debugPrint(e.toString());
              debugPrint(exe.message);
              if (exe.message ==
                  "The Internet connection appears to be offline.") {
                ref.watch(nNotifier).state = -2;
              } else {
                ref.watch(nNotifier).state = -1;
              }
            },
          );
        }
/*        if (mounted && dashboardPanel.isPanelClosed) {
          dashboardPanelNotifier.dWidget = const NoInternet();
          dashboardPanelNotifier.dHeight = 180.h;
          dashboardPanel.open();
        }*/
      },
    );
  }

  @override
  void dispose() {
    if (mounted) {
      if (dashboardPanel.isPanelOpen) {
        dashboardPanel.close();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeIn(
        child: Container(
          alignment: Alignment.center,
          color: magnolia,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: AutoSizeText(
            widget.s,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: frenchGray,
                ),
            maxLines: 1,
          ),
        ),
      );
}
