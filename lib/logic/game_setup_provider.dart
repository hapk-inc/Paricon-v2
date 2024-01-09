import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/local_icon.dart';
import '../my_widget/g_icons.dart';

final AutoDisposeProvider<GameSetup> setupProvider =
    Provider.autoDispose<GameSetup>((_) => GameSetup());

class GameSetup {
  List<LocalIcon> get newIcons {
    List<IconData> x = List.from(gIcons);
    x.shuffle();
    List<IconData> y = List.from(x.take(28));
    List<IconData> z = y + y;
    z.shuffle();
    return List.generate(
      56,
      (index) => LocalIcon(iconCode: z[index].codePoint, iconNo: index),
    );
  }
}
