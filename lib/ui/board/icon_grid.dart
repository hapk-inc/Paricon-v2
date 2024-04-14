import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../logic/board/notifier.dart';
import '../../model/local_icon.dart';
import 'icon_grid_tile.dart';

//Logger _logger = Logger();

class IconGrid extends ConsumerWidget {
  const IconGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final sizeNotifier = ref.watch(sizeProvider.notifier);

    final BoardNotifier boardNotifier = ref.watch(boardNotifierProvider);

    final Map<String, LocalIcon> icons = boardNotifier.board.icons;
    debugPrint(icons.length.toString());

    return Container(
      alignment: Alignment.center,
      child: ResponsiveGridList(
        listViewBuilderOptions: ListViewBuilderOptions(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
        ),
        horizontalGridMargin: 15.r,
        verticalGridMargin: 15.r,
        //horizontalGridMargin: sizeNotifier.isP ? 15.r : 18.r,
        //verticalGridMargin: sizeNotifier.isP ? 15.r : 18.r,
        minItemsPerRow: 7,
        maxItemsPerRow: 8,
        horizontalGridSpacing: 7.5.r,
        verticalGridSpacing: 7.5.r,
        //maxItemsPerRow: sizeNotifier.isP ? 7 : 8,
        //horizontalGridSpacing: sizeNotifier.isP ? 7.5.r : 9.r,
        //verticalGridSpacing: sizeNotifier.isP ? 7.5.r : 9.r,
        minItemWidth: 1.w,
        children: List.generate(
          icons.length,
          (index) => IconGridTile(icons.keys.toList()[index]),
        ), // The list of widgets in the list
      ),
    );
  }
}
