import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../logic/app/size_provider.dart';
import '../values/colors.dart';

class LeaderBoard extends ConsumerWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final sizeNotifier = ref.watch(sizeProvider.notifier);
    //final bool isP = SizeNotifier(screenSize).isP;

    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      //mainAxisCellCount: 12,
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(3),
          1: FlexColumnWidth(9),
          2: FlexColumnWidth(5),
          3: FlexColumnWidth(3),
        },
        children: List.generate(
          //mockInteger(5, 7),
          7,
          (index) => TableRow(
            decoration: const BoxDecoration(color: magnolia),
            children: ["Rank", "Name", "Duration", "When"]
                .map(
                  (String e) => Container(
                    height: sizeNotifier.isP ? 54.h : 60.h,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 12.w),
                    child: Text(
                      e,
                      maxLines: 1,
                      style: textTheme.headlineMedium,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
