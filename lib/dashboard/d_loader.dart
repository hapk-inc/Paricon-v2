import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../logic/dashboard_panel_provider.dart';
import '../../logic/panel_provider.dart';
import '../../my_widget/no_internet.dart';
import '../../theme/my_color.dart';

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
    final DashboardPanelNotifier dashboardPanelNotifier =
        ref.read(dashboardPanelNotifierProvider);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (mounted && dashboardPanel.isPanelClosed) {
          dashboardPanelNotifier.dWidget = const NoInternet();
          dashboardPanelNotifier.dHeight = 180.h;
          dashboardPanel.open();
        }
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
