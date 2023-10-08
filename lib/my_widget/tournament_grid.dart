import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../logic/s_size.dart';
import '../theme/my_color.dart';
import 'g_icons.dart';

class TournamentGrid extends ConsumerWidget {
  const TournamentGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);

    List<Widget> tiles = [
      // if (!(row - 9).isNegative)
      //   ...List.generate(8 * (row - 9), (index) => Container()),
      ...List.generate(
        72,
        //count,
        (index) => TournamentGridTile(index: index),
      )
    ];
    tiles.shuffle();
    return Center(
      child: ResponsiveGridList(
        listViewBuilderOptions: ListViewBuilderOptions(
          physics: const NeverScrollableScrollPhysics(),
        ),
        minItemWidth: 1.w,
        minItemsPerRow: 7,
        horizontalGridSpacing: 6.w,
        verticalGridSpacing: 6.h,
        horizontalGridMargin: 0,
        verticalGridMargin: 0,
        maxItemsPerRow: 8,
        children: tiles,
      ),
    );
  }
}

class TournamentGridTile extends ConsumerWidget {
  final int index;
  const TournamentGridTile({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    final bool isPhone = sSize == ScreenSize.phone;
    //final tournamentNotifier = ref.watch(tournamentNotifierProvider);

    final showIcon = Random().nextBool();

    return AspectRatio(
      aspectRatio: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        transform: Matrix4.rotationZ(
          (!Random().nextBool()
                  ? (Random.secure().nextBool() ? -pi : pi)
                  : -pi) /
              (Random().nextBool() ? 60 : 45),
        ),
        /*transform: Matrix4.rotationZ(
          (!tournamentNotifier.icons[index].checkFound()
                  ? (Random.secure().nextBool() ? -pi : pi)
                  : -pi) /
              (tournamentNotifier.icons[index].checkFound() ? 60 : 45),
        ),*/
        child: Card(
          color: showIcon
              ? majorelleBlue
              : [
                  ...[aquamarine, uranianBlue],
                  // ...[aquamarine, uranianBlue],
                  ...[rosePompadour, xantHous],
                  ...[rosePompadour, xantHous],
                ][mockInteger(0, 5)],
          //: [teaGreen, peach, lavenderPink][mockInteger(0, 2)],
          //: [lapisLazuli, pear, bitterSweet, orangePeel][mockInteger(0, 3)],
          margin: EdgeInsets.zero,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.5.r),
          ),
          child: InkWell(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: showIcon
                  ? Icon(gIcons[mockInteger(0, gIcons.length - 1)],
                      size: 24.r, color: ghostWhite)
                  : Random().nextBool()
                      ? Icon(gIcons[mockInteger(0, gIcons.length - 1)],
                          size: 24.r, color: richBlack)
                      : Container(),
            ),
          ),
        ),
      ),
    );
  }
}
