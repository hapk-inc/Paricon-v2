import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../logic/s_size.dart';

import '../my_widgets/app_bar.dart';
//import 'dashboard/dashboard_p.dart';
//import 'dashboard/dashboard_w.dart';

@RoutePage()
class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    return Scaffold(
      appBar: myAppBar(sSize),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: sSize == ScreenSize.phone || sSize == ScreenSize.tab
                ? Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Currently in Development",
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                : const Center(
                    child: Text(
                      "Currently in Development Stage",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
            /*? const DashboardP()
              : const DashboardW(),*/
            ),
      ),
    );
  }
}
