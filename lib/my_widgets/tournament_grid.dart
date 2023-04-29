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
        return ResponsiveGridList(
          minItemWidth: 1,
          horizontalGridSpacing: 5.w,
          verticalGridSpacing: 5.h,
          horizontalGridMargin: 0,
          verticalGridMargin: 0,
          maxItemsPerRow: row + 1,
          children: List.generate(
            count,
            (index) => TournamentGridTile(index: index),
          ),
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
