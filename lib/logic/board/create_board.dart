import 'package:flutter/material.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/values/colors.dart';

import '../../model/local_icon.dart';
import '../../model/local_player.dart';
import '../../model/player.dart';
import 'board_icons.dart';

class CreateBoard {
  static Map<String, LocalIcon> icons([int totalIcon = 56]) {
    List<int> overall = List.from(boardIcon.keys);
    overall.shuffle();

    List<int> filter = List.from(overall.take(totalIcon ~/ 2));

    List<int> mix = filter + filter;

    mix.shuffle();
    List<String> keys = List.generate(mix.length, (index) => mockString(12));
    List<LocalIcon> values = List.generate(
        mix.length, (index) => LocalIcon(iconCode: mix[index], iconNo: index));
    return Map.fromIterables(keys, values);
  }

  static Map<String, LocalPlayer> localPlayers(Map<String, Player?> users) {
    final List<Color> color = List.from(iconColor);

    if (users.length == 2) {
      color.remove((mockInteger(0, 1) == 0) ? aquamarine : uranianBlue);
    }
    color.shuffle();
    return Map<String, LocalPlayer>.fromIterables(
      users.keys,
      users.values.map(
        (e) {
          final int index = List.from(users.values).indexOf(e);
          return LocalPlayer(
            name: e?.name ?? "User#",
            playerNo: index,
            color: color[index],
          );
        },
      ),
    );
  }
}
