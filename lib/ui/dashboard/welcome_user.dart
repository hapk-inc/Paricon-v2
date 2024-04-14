import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
    final String? welcome = ref
        .watch(welcomeUserProvider)
        .when(data: (data) => data, error: (e, s) => null, loading: () => null);
    final TextTheme textTheme = Theme.of(context).textTheme;
    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: me == null
          ? Container()
          : ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
              title: ListTile(
                tileColor: ghostWhite,
                title: AutoSizeText(
                  me.name,
                  style: textTheme.titleLarge?.copyWith(color: violetBlue),
                  maxLines: 1,
                ),
                trailing: IconButton(
                  color: violetBlue,
                  iconSize: 27.r,
                  onPressed: () => context.router.push(const SettingsRoute()),
                  icon: const Icon(Icons.settings_rounded),
                ),
              ),
              subtitle: welcome == null
                  ? null
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          welcome,
                          key: ValueKey(welcome),
                          style: textTheme.bodyMedium
                              ?.copyWith(color: tropicalIndigo),
                          //maxLines: 2,
                        ),
                      ),
                    ),
            ),
    );
  }
}
