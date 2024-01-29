import 'package:flutter/material.dart';

import '../model/board.dart';
import '../model/local_icon.dart';
import '../my_widget/g_icons.dart';
import 'room_level_notifier.dart';

/*final AutoDisposeProvider<GameSetup> setupProvider =
    Provider.autoDispose<GameSetup>((_) => GameSetup());*/

class GameSetup {
  List<LocalIcon> newIcons(RoomLevel level) {
    List<IconData> x = List.from(gIcons);
    x.shuffle();
    List<IconData> y = List.from(x.take(iconCount(level)));
    List<IconData> z = y + y;
    z.shuffle();
    return List.generate(
      iconCount(level) * 2,
      (index) => LocalIcon(iconCode: z[index].codePoint, iconNo: index),
    );
  }

  int iconCount(level) {
    switch (level) {
      case RoomLevel.easy:
        return 15;
      case RoomLevel.medium:
        return 28;
      case RoomLevel.hard:
        return 32;
      default:
        return 0;
    }
  }

  int maxItemsPerRow(int iconCount) {
    if (iconCount == 30) return 5;
    if (iconCount == 56) return 7;
    return 8;
  }

  String whichLevel(int count) {
    switch (count) {
      case 4:
        return "easy";
      case 8:
        return "medium";
      case 12:
        return "hard";
      default:
        return "";
    }
  }

  String collectionPath(Board board) {
    final String level = whichLevel(board.icons.length);
    return "$level-${board.type.name}-${board.players.length}";
  }
}
