import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../logic/app/device_provider.dart';
import '../../values/colors.dart';

class AppVersion extends ConsumerWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => StaggeredGridTile.fit(
        crossAxisCellCount: 15,
        child: Center(
          child: ref.watch(packageInfoProvider).maybeWhen(
                orElse: () => Container(),
                data: (app) => Text(
                  "Version ${app.version}  (${app.buildNumber})",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: frenchGray),
                ),
              ),
        ),
      );
}
