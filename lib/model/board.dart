import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'board.freezed.dart';

@freezed
class Board with _$Board {
  const factory Board({
    @Default([]) List players,
    required List icons,
    required String currentID,
    required String type,
    String? currentIcon,
  }) = _Board;

  factory Board.fromJson(Map<String, dynamic> json) {
    final map = Map<String, dynamic>.from(json);

    final mIcons = map['icons'];

    //Arrange icons and players based on iconNo and playerNo
    final sortedIcons = SplayTreeMap.from(
      mIcons,
      (a, b) => mIcons[a]["iconNo"].compareTo(mIcons[b]["iconNo"]),
    );
    List m = [];

    if (map.containsKey('players')) {
      final mPlayers = map['players'];
      //Arrange icons and players based on iconNo and playerNo
      final sortedPlayers = SplayTreeMap.from(
        mPlayers,
        (a, b) => mPlayers[a]["playerNo"].compareTo(mPlayers[b]["playerNo"]),
      );
      m = Map<String, dynamic>.from(sortedPlayers).keys.toList(growable: false);
    }

    final Board _board = Board(
      players: m,
      icons:
          Map<String, dynamic>.from(sortedIcons).keys.toList(growable: false),
      currentID: map['currentID'],
      type: map['type'] as String,
      currentIcon: map['currentIcon'] as String?,
    );
    return _board;
  }
}
