import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../logic/tournament_listener.dart';
import '../model/local_icon.dart';
import '../theme/my_color.dart';

class TournamentGrid extends ConsumerWidget {
  const TournamentGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final sSize = ref.read(sizeProvider);

    final tListener = ref.read(tournamentListenerNotifier);

    /*List<Widget> tiles = [
      // if (!(row - 9).isNegative)
      //   ...List.generate(8 * (row - 9), (index) => Container()),
      ...List.generate(
        72,
        //count,
        (index) => TournamentGridTile(index: index),
      )
    ];*/
    List<Widget> tiles = List.from(
      tListener.icons.map(
        (e) => TournamentGridTile(localIcon: e),
      ),
    );
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
  final LocalIcon localIcon;
  const TournamentGridTile({required this.localIcon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final sSize = ref.read(sizeProvider);
    //final bool isPhone = sSize == ScreenSize.phone;
    //final tournamentNotifier = ref.watch(tournamentNotifierProvider);
    final tListener = ref.watch(tournamentListenerNotifier);
    final xIcon = ref.watch(tournamentListenerNotifier).icons[localIcon.iconNo];
    final showIcon = xIcon.checkFound;

    return AspectRatio(
      aspectRatio: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        transform: Matrix4.rotationZ(
          (!showIcon ? (Random.secure().nextBool() ? -pi : pi) : -pi) /
              (showIcon ? 60 : 45),
        ),
        child: Card(
          color: xIcon.isFound
              ? majorelleBlue
              : [
                  ...[aquamarine, uranianBlue],
                  ...[aquamarine, uranianBlue],
                  ...[xantHous],
                  //...[rosePompadour, xantHous],
                ][mockInteger(0, 4)],
          //: [teaGreen, peach, lavenderPink][mockInteger(0, 2)],
          //: [lapisLazuli, pear, bitterSweet, orangePeel][mockInteger(0, 3)],
          margin: EdgeInsets.zero,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.5.r),
          ),
          child: InkWell(
            onTap: tListener.inWait || xIcon.checkFound
                ? null
                : () {
                    debugPrint(xIcon.iconCode.toString());
                    debugPrint(xIcon.iconNo.toString());
                    debugPrint(xIcon.toString());
                    tListener.iconClick(xIcon);
                  },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: xIcon.isFound
                  ? Icon(
                      IconData(
                        xIcon.iconCode,
                        fontFamily: 'MaterialIcons',
                      ),
                      size: 24.r,
                      color: ghostWhite,
                    )
                  : xIcon.isCheck
                      ? Icon(
                          IconData(
                            xIcon.iconCode,
                            fontFamily: 'MaterialIcons',
                          ),
                          size: 24.r,
                          color: coyote,
                        )
                      : Container(),
            ),
          ),
        ),
      ),
    );
  }
}
