import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/board.dart';
import '../model/local_icon.dart';
import '../my_widget/g_icons.dart';
import 'room_level_notifier.dart';

/*final AutoDisposeProvider<GameSetup> setupProvider =
    Provider.autoDispose<GameSetup>((_) => GameSetup());*/

class GameSetup {
  final RoomLevel level;
  final Map<RoomLevel, int> map = {
    RoomLevel.easy: 8,
    RoomLevel.medium: 15,
    RoomLevel.hard: 28
  };

  GameSetup({this.level = RoomLevel.medium});

  List<LocalIcon> get newIcons {
    List<IconData> x = List.from(gIcons);
    x.shuffle();
    //List<IconData> y = List.from(x.take(iconCount(level)));
    List<IconData> y = List.from(x.take(map[level]!));
    List<IconData> z = y + y;
    z.shuffle();
    return List.generate(
      map[level]! * 2,
      (index) => LocalIcon(iconCode: z[index].codePoint, iconNo: index),
    );
  }

  int gridRow(int totalCount) {
    RoomLevel l = whichLevel(totalCount);
    switch (l) {
      case RoomLevel.easy:
        return 4;
      case RoomLevel.medium:
        return 6;
      case RoomLevel.hard:
        return 7;
    }
  }

  RoomLevel whichLevel(int totalCount) {
    int x = totalCount ~/ 2;
    RoomLevel l = map.keys.firstWhere((element) => map[element] == x);
    return l;
  }

  double get containerSize {
    switch (level) {
      case RoomLevel.easy:
        return 300.r;
      case RoomLevel.medium:
        return 480.r;
      case RoomLevel.hard:
        return 480.r;
    }
  }

  String collectionPath(Board board) {
    final String l = whichLevel(board.icons.length).name;
    return "$l-${board.type.name}-${board.players.length}";
  }

  double iconSize(int totalCount) {
    RoomLevel l = whichLevel(totalCount);
    switch (l) {
      case RoomLevel.easy:
        return 33.r;
      case RoomLevel.medium:
        return 30.r;
      case RoomLevel.hard:
        return 30.r;
    }
  }
}
