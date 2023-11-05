import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/firebase_init.dart';
import '../my_widget/no_internet_panel.dart';

class DashboardPanel extends ConsumerWidget {
  const DashboardPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(internetConnectionProvider).when(
          data: (connect) => connect == ConnectivityResult.none
              ? const NoInternetPanel()
              : Container(),
          error: (_, __) => Container(),
          loading: () => Container());
}
