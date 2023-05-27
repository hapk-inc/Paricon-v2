import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../logic/tournament_notifier.dart';

class TournamentGrid extends ConsumerWidget {
  const TournamentGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tournamentNotifier = ref.read(tournamentNotifierProvider);
    int count = tournamentNotifier.icons.length;

    //print(360.w / 9.5);

    return LayoutBuilder(
      builder: (p0, p1) {
        double exHeight = p1.maxHeight;
        double gridSize = 360.w / 8;
        int row = exHeight ~/ gridSize;
        print("RowCount $row");
        List<Widget> tiles = [
          if (!(row - 9).isNegative)
            ...List.generate(8 * (row - 9), (index) => Container()),
          ...List.generate(
            count,
            (index) => TournamentGridTile(index: index),
          )
        ];
        tiles.shuffle();
        return ResponsiveGridList(
          minItemWidth: 1, minItemsPerRow: 7,
          horizontalGridSpacing: 5.w,
          verticalGridSpacing: 5.h,
          horizontalGridMargin: 0,
          verticalGridMargin: 0,
          maxItemsPerRow: 8,
          //minItemsPerRow: 5,
          children: tiles,
        );
      },
    );
  }
}

class TournamentGrid1 extends ConsumerWidget {
  const TournamentGrid1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tournamentNotifier = ref.read(tournamentNotifierProvider);
    int count = tournamentNotifier.icons.length;

    return LayoutBuilder(
      builder: (p0, p2) {
        int row = 13;
        double a = 1;
        while (!(a.isNegative)) {
          row--;
          int colBoxNumber = (count / row).ceil();
          double boxWidth = p2.maxWidth / row;
          a = p2.maxHeight - (colBoxNumber * boxWidth);

          // ref.read(tournamentNotifierProvider).footerHeight = a;
        }
        List<Widget> tiles = [
          // ...List.generate(8, (index) => Container()),
          ...List.generate(
            count,
            (index) => TournamentGridTile(index: index),
          )
        ];
        tiles.shuffle();
        print("Remaining height $a");
        return ResponsiveGridList(
          minItemWidth: 1,
          horizontalGridSpacing: 5.w,
          verticalGridSpacing: 5.h,
          horizontalGridMargin: 0,
          verticalGridMargin: 0,
          maxItemsPerRow: row + 1,
          children: tiles,
        );
      },
    );
  }
}

class TournamentGridTile extends ConsumerWidget {
  final int index;
  const TournamentGridTile({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tournamentNotifier = ref.watch(tournamentNotifierProvider);

    return AspectRatio(
      aspectRatio: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        transform: Matrix4.rotationZ(
          (!tournamentNotifier.icons[index].checkFound()
                  ? (Random.secure().nextBool() ? -pi : pi)
                  : -pi) /
              (tournamentNotifier.icons[index].checkFound() ? 60 : 45),
        ),
        child: Card(
          color: tournamentNotifier.icons[index].isFound
              ? [
                  const Color(0xff0075c4),
                  const Color(0xffefa00b),
                  const Color(0xff963484),
                  const Color(0xff591f0a),
                ][mockInteger(0, 3)]
              : const Color(0xff1f2232),
          margin: EdgeInsets.zero,
          elevation: Random().nextBool() ? 4 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: InkWell(
            onTap: tournamentNotifier.inWait ||
                    tournamentNotifier.icons[index].checkFound()
                ? null
                : () {
                    if (kDebugMode) {
                      print(tournamentNotifier.icons[index]);
                    }
                    tournamentNotifier
                        .iconClick(tournamentNotifier.icons[index]);
                  },
            child: LayoutBuilder(
              builder: (p0, p1) => AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: !tournamentNotifier.icons[index].checkFound()
                    ? null
                    : Padding(
                        padding: EdgeInsets.only(
                          left: p1.maxWidth * 0.2,
                          top: p1.maxHeight * 0.25,
                          bottom: p1.maxHeight * 0.25,
                          right: p1.maxWidth * 0.25,
                        ),
                        child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Icon(
                              IconData(
                                tournamentNotifier.icons[index].iconCode,
                                fontFamily: 'FontAwesomeSolid',
                                fontPackage: 'font_awesome_flutter',
                              ),
                              color: const Color(0xfffde8e9),
                            )),
                      ),
              ),
            ),
          ),
        ),
      ) /*Container(
        decoration: BoxDecoration(
            color: const Color(0xff1f2232),
            borderRadius: BorderRadius.circular(4.0)),
      )*/
      ,
    );
  }
}

class TournamentGridTile3 extends ConsumerWidget {
  final int index;
  const TournamentGridTile3({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tournamentNotifier = ref.watch(tournamentNotifierProvider);

    return AspectRatio(
      aspectRatio: 1,
      child: LayoutBuilder(
        builder: (p0, p1) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            transform: Matrix4.rotationZ(
              (!tournamentNotifier.icons[index].checkFound()
                      ? (Random.secure().nextBool() ? -pi : pi)
                      : -pi) /
                  (tournamentNotifier.icons[index].checkFound() ? 60 : 45),
            ),
            child: LayoutBuilder(
              builder: (p0, p3) => AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                    color: !tournamentNotifier.icons[index].isFound
                        ? Colors.deepPurpleAccent.shade700
                        : Colors.primaries[mockInteger(5, 9)].shade700,
                    borderRadius: BorderRadius.circular(4)),
                alignment: Alignment.center,
                child: InkWell(
                  onTap: tournamentNotifier.inWait ||
                          tournamentNotifier.icons[index].checkFound()
                      ? null
                      : () {
                          if (kDebugMode) {
                            print(tournamentNotifier.icons[index]);
                          }
                          tournamentNotifier
                              .iconClick(tournamentNotifier.icons[index]);
                        },
                  child: !tournamentNotifier.icons[index].checkFound()
                      ? FadeOut(child: const BlankOne())
                      : FadeIn(
                          child: TournamentGridTileIcon(
                            tournamentNotifier: tournamentNotifier,
                            index: index,
                          ),
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TournamentGridTileIcon extends StatelessWidget {
  const TournamentGridTileIcon({
    super.key,
    required this.tournamentNotifier,
    required this.index,
  });

  final TournamentNotifier tournamentNotifier;
  final int index;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p3) => Icon(
        IconData(
          tournamentNotifier.icons[index].iconCode,
          fontFamily: 'FontAwesomeSolid',
          fontPackage: 'font_awesome_flutter',
        ),
        color: Colors.deepPurple.shade100,
        size: p3.maxHeight * 0.5,
      ),
    );
  }
}

class BlankOne extends StatelessWidget {
  const BlankOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
