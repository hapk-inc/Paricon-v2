import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mock_data/mock_data.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import 'f_icons.dart';

class IconGrid extends StatelessWidget {
  const IconGrid({super.key});

  @override
  Widget build(BuildContext context) {
    //GameLevel level = GameLevel.hard;
    int count = 72;
    return LayoutBuilder(
      builder: (p0, p2) {
        int row = 13;
        double a = 1;
        while (!a.isNegative) {
          row--;
          int colBoxNumber = (count / row).ceil();
          double boxWidth = p2.maxWidth / row;
          a = p2.maxHeight - (colBoxNumber * boxWidth);
        }
        return ResponsiveGridList(
          minItemWidth: 1,
          horizontalGridSpacing: 1,
          verticalGridSpacing: 1,
          horizontalGridMargin: 4,
          verticalGridMargin: 8,
          maxItemsPerRow: row + 1,
          children: List.generate(
            count,
            (index) => IconGridTile(index: index),
          ),
        );
      },
    );
  }

  /*int totalCount(GameLevel level) {
    switch (level) {
      case GameLevel.easy:
        return 36;

      case GameLevel.medium:
        return 56;

      case GameLevel.hard:
        return 72;
    }
  }*/
}

class IconGridTile extends StatelessWidget {
  final int index;
  const IconGridTile({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        transform: Matrix4.rotationZ(
          // (!icon.checkFound()
          (!Random().nextBool()
                  ? (Random.secure().nextBool() ? -pi : pi)
                  : -pi) /
              // (icon.checkFound() ? 60 : 15),
              (Random().nextBool() ? 60 : 15),
        ),
        child: Card(
          elevation: 4,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            padding: const EdgeInsets.all(6),
            color: Colors.primaries[mockInteger(5, 9)],
            child: Center(
              child: FittedBox(
                child: Icon(fIcons[mockInteger(0, fIcons.length - 1)]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
