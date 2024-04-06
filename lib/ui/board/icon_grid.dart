import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:mock_data/mock_data.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../enums/enums.dart';
import '../../logic/app/size_provider.dart';
import '../../logic/board/board_icons.dart';
import '../../logic/board/notifier.dart';
import '../../model/local_icon.dart';
import '../../values/colors.dart';

Logger _logger = Logger();

class IconGrid extends ConsumerWidget {
  const IconGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize screenSize = ref.watch(sizeProvider);
    final bool isP = SizeNotifier(screenSize).isP;
    final BoardNotifier boardNotifier = ref.watch(boardNotifierProvider);
    return Container(
      alignment: SizeNotifier.isSmallScreen
          ? Alignment.center
          : isP
              ? Alignment.center
              : Alignment.center,
      child: ResponsiveGridList(
          listViewBuilderOptions: ListViewBuilderOptions(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
          horizontalGridMargin: isP ? 15.r : 18.r,
          verticalGridMargin: isP ? 15.r : 18.r,
          minItemsPerRow: 6,
          maxItemsPerRow: isP ? 7 : 8,
          horizontalGridSpacing: isP ? 7.5.r : 9.r,
          verticalGridSpacing: isP ? 7.5.r : 9.r,
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

    final LocalIcon? localIcon = boardNotifier.board.icons[id];

    bool show = localIcon?.checkFound ?? false;
    double randomPi = mockInteger(0, 1) == 0 ? pi : -pi;
    final Color color = iconColor[mockInteger(0, 2)];
    return AspectRatio(
      aspectRatio: 1,
      child: localIcon == null
          ? null
          : AnimatedContainer(
              transform: Matrix4.rotationZ(
                (!show ? randomPi : -pi) / (show ? 60 : 45),
              ),
              duration: const Duration(milliseconds: 600),
              child: Card(
                color: color,
                elevation: 1.5.r,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.6.r),
                ),
                child: InkWell(
                  onTap: () {
                    _logger.i(localIcon.toString());
                    boardNotifier.iconClick(id);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    color: color,
                    padding: EdgeInsets.all(9.0.r),
                    child: localIcon.checkFound
                        ? FadeIn(
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Icon(
                                boardIcon[localIcon.iconCode],
                                color: charcoal,
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
              ),
            ),
    );
  }
}
