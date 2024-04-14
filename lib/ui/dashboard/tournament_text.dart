import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../logic/app/ai_bloc.dart';
import '../../values/colors.dart';

class TournamentText extends ConsumerWidget {
  const TournamentText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final Player? me = ref.watch(userNotifierProvider).me;
    final String? text = ref.watch(tournamentTextProvider).maybeWhen(
          orElse: () => null,
          data: (data) => data,
          error: (error, stackTrace) =>
              "Ready, Set, Game : Join the Tournament.",
        );
    final String? sub = ref.watch(subTournamentTextProvider).maybeWhen(
          orElse: () => null,
          data: (data) => data,
        );
    final TextTheme textTheme = Theme.of(context).textTheme;

    final int mainTextSize = (text ?? "").length;

    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
        title: Center(
          child: ListTile(
            tileColor: ghostWhite,
            title: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: AutoSizeText(
                text ?? "",
                key: ValueKey(key),
                style: textTheme.titleLarge?.copyWith(color: jasper),
                maxLines: mainTextSize < 30
                    ? 1
                    : mainTextSize < 60
                        ? 2
                        : null,
              ),
            ),
          ),
        ),
        subtitle: sub == null
            ? null
            : Align(
                alignment: Alignment.centerLeft,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: AutoSizeText(
                    "$sub 🏆",
                    key: ValueKey(sub),
                    style: textTheme.bodyMedium?.copyWith(color: jasper),
                    maxLines: sub.length < 60 ? 1 : null,
                  ),
                ),
              ),
      ),
    );
  }
}
