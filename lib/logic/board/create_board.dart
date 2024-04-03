import 'package:flutter/material.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/values/colors.dart';

import '../../model/local_icon.dart';
import '../../model/local_player.dart';
import '../../model/player.dart';
import 'board_icons.dart';

class CreateBoard {
  static Map<String, LocalIcon> get icons {
    List<IconData> overall = List.from(boardIcon.values);
    overall.shuffle();

    List<IconData> filter = List.from(overall.take(28));
    List<IconData> mix = filter + filter;

    mix.shuffle();
    return {
      for (var icon in mix)
        mockString(8):
            LocalIcon(iconCode: icon.codePoint, iconNo: mix.indexOf(icon))
    };
  }

  static Map<String, LocalPlayer> localPlayers(Map<String, Player> users) {
    return Map<String, LocalPlayer>.fromIterables(
      users.keys,
      users.values.map(
        (e) {
          final int index = List.from(users.values).indexOf(e);
          return LocalPlayer(
            name: e.name,
            playerNo: index,
            color: iconColor[index],
          );
        },
      ),
    );
  }
}
