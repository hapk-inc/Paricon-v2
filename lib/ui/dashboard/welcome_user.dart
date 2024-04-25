import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:paricon/values/names.dart';

import '../../logic/app/ai_bloc.dart';
import '../../logic/user/bloc.dart';
import '../../model/player.dart';
import '../../router/my_route.dart';
import '../../values/colors.dart';

class WelcomeUser extends ConsumerWidget {
  const WelcomeUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Player? me = ref.watch(userNotifierProvider).me;
    final String? welcome = ref.watch(welcomeUserProvider).when(
          data: (data) => data,
          error: (e, s) => null,
          loading: () => "Checking for the updates",
        );
    final TextTheme textTheme = Theme.of(context).textTheme;
    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  me?.name ?? NameGen.dummyName(),
                  style: textTheme.titleLarge?.copyWith(color: violetBlue),
                  maxLines: 1,
                ),
                IconButton(
                  onPressed: () => context.router.push(const SettingsRoute()),
                  icon: const Icon(Icons.settings_rounded),
                ),
              ],
            ),
            Gap(1.5.r),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: AutoSizeText(
                welcome ?? "Nothing much",
                key: ValueKey(welcome),
                style: textTheme.bodyMedium?.copyWith(color: tropicalIndigo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
