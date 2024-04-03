import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../enums/enums.dart';
import '../../logic/app/size_provider.dart';
import '../../logic/board/board_icons.dart';
import '../../values/colors.dart';

class IconGrid extends ConsumerWidget {
  const IconGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize screenSize = ref.watch(sizeProvider);
    final bool isP = SizeNotifier(screenSize).isP;
    return Container(
      alignment: Alignment.center,
      child: ResponsiveGridList(
          listViewBuilderOptions: ListViewBuilderOptions(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
          horizontalGridMargin: isP ? 15.r : 21.r,
          verticalGridMargin: isP ? 15.r : 21.r,
          minItemsPerRow: 6,
          maxItemsPerRow: isP ? 7 : 8,
          horizontalGridSpacing: isP ? 7.2.r : 9.r,
          verticalGridSpacing: isP ? 7.2.r : 9.r,
          minItemWidth: 1.w,
          children: List.generate(
            56,
            (index) => IconGridTile(index),
          ) // The list of widgets in the list
          ),
    );
  }
}

class IconGridTile extends ConsumerWidget {
  final int index;
  const IconGridTile(this.index, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize screenSize = ref.watch(sizeProvider);
    final bool isP = SizeNotifier(screenSize).isP;
    bool show = false;
    double randomPi = mockInteger(0, 1) == 0 ? pi : -pi;
    final Color color = iconColor[mockInteger(0, 2)];
    return AspectRatio(
      aspectRatio: 1,
      child: AnimatedContainer(
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
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            color: color,
            padding: EdgeInsets.all(isP ? 9.r : 9.6.r),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Icon(
                boardIcon[index],
                color: charcoal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
