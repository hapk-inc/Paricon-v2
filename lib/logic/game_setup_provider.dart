import 'package:flutter/material.dart';

import '../model/local_icon.dart';
import '../my_widget/g_icons.dart';
import 'room_level_notifier.dart';

/*final AutoDisposeProvider<GameSetup> setupProvider =
    Provider.autoDispose<GameSetup>((_) => GameSetup());*/

class GameSetup {
  final RoomLevel level;

  GameSetup(this.level);

  List<LocalIcon> get newIcons {
    List<IconData> x = List.from(gIcons);
    x.shuffle();
    List<IconData> y = List.from(x.take(iconCount));
    List<IconData> z = y + y;
    z.shuffle();
    return List.generate(
      iconCount * 2,
      (index) => LocalIcon(iconCode: z[index].codePoint, iconNo: index),
    );
  }

  int get iconCount {
    switch (level) {
      case RoomLevel.easy:
        return 2;
      case RoomLevel.medium:
        return 28;
      case RoomLevel.hard:
        return 32;
    }
  }
}
