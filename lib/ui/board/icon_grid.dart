import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../logic/app/game_match_bloc.dart';
import '../../logic/app/size_provider.dart';
import '../../logic/board/board_icons.dart';
import '../../logic/board/notifier.dart';
import '../../model/local_icon.dart';
import '../../values/colors.dart';

//Logger _logger = Logger();

class IconGrid extends ConsumerWidget {
  const IconGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeNotifier = ref.watch(sizeProvider.notifier);

    final BoardNotifier boardNotifier = ref.watch(boardNotifierProvider);
    return Container(
      alignment: Alignment.center,
      child: ResponsiveGridList(
          listViewBuilderOptions: ListViewBuilderOptions(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
          horizontalGridMargin: sizeNotifier.isP ? 15.r : 18.r,
          verticalGridMargin: sizeNotifier.isP ? 15.r : 18.r,
          minItemsPerRow: 6,
          maxItemsPerRow: sizeNotifier.isP ? 7 : 8,
          horizontalGridSpacing: sizeNotifier.isP ? 7.5.r : 9.r,
          verticalGridSpacing: sizeNotifier.isP ? 7.5.r : 9.r,
          minItemWidth: 1.w,
          children: List.generate(
            boardNotifier.board.icons.length,
            (index) =>
                IconGridTile(boardNotifier.board.icons.keys.toList()[index]),
          ) // The list of widgets in the list
          ),
    );
  }
}

class IconGridTile extends ConsumerWidget {
  final String id;
  const IconGridTile(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BoardNotifier boardNotifier = ref.watch(boardNotifierProvider);

    final bool dailyMatch =
        ref.watch(matchNotifierProvider.notifier).isDailyMatch;
    final LocalIcon? localIcon = boardNotifier.board.icons[id];

    if (localIcon == null) return Container();

    final bool checkFound = localIcon.checkFound;

    double randomPi = mockInteger(0, 1) == 0 ? pi : -pi;

    final Color random = iconColor[mockInteger(0, 2)];

    final Color initColor = dailyMatch ? random : majorelleBlue;

    final Color color = (localIcon.isFound ?? false)
        ? (localIcon.color ?? initColor)
        : initColor;

    final Color iColor = localIcon.isFound ?? false ? ghostWhite : charcoal;

    final double rotation =
        (!checkFound ? randomPi : -pi) / (checkFound ? 60 : 45);

    return AspectRatio(
      aspectRatio: 1,
      child: AnimatedContainer(
        transform: Matrix4.rotationZ(rotation),
        duration: const Duration(milliseconds: 600),
        child: Card(
          color: color,
          elevation: 1.5.r,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.6.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3.6.r),
            child: InkWell(
              onTap: !boardNotifier.wait && !checkFound
                  ? () async => boardNotifier.iconClick(id)
                  : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                color: color,
                padding: EdgeInsets.all(9.0.r),
                child: checkFound
                    ? FadeIn(
                        key: ValueKey("$id $checkFound"),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Icon(
                            boardIcon[localIcon.iconCode],
                            color: iColor,
                          ),
                        ),
                      )
                    : Container(key: ValueKey("$id $checkFound")),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
