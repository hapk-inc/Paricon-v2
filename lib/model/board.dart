import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paricon/model/friendly_stats.dart';

import '../enums/enums.dart';
import '../values/colors.dart';
import 'local_icon.dart';
import 'local_icon_converter.dart';
import 'local_player.dart';
import 'local_player_converter.dart';

part 'board.freezed.dart';
part 'board.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Board with _$Board {
  const Board._();

  @JsonSerializable(includeIfNull: false)
  const factory Board({
    @LocalPlayerConverter() @Default({}) Map<String, LocalPlayer> players,
    @LocalIconConverter() @Default({}) Map<String, LocalIcon> icons,
    String? currentID,
    @Default(BoardType.normal) BoardType type,
    String? currentIcon,
  }) = _Board;

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

  factory Board.fromSnapshot(DataSnapshot snapshot) {
    Map map = snapshot.value as Map;
    Map<String, dynamic> json = Map<String, dynamic>.from(map);
    final Board board = Board.fromJson(json);
    return board;
  }

  bool? updateIcon(String icon) {
    Iterable<MapEntry<String, LocalIcon>> clickedIcons =
        icons.entries.where((x) => x.value.isCheck ?? false);
    if (clickedIcons.length <= 1) return null;
    bool validate = clickedIcons
        .every((element) => icons[icon]?.iconCode == element.value.iconCode);
    if (validate) {
      for (MapEntry<String, LocalIcon> e in clickedIcons) {
        icons.update(
          e.key,
          (value) => value.copyWith(
            isCheck: false,
            isFound: true,
            color:
                currentID == null ? majorelleBlue : players[currentID]!.color,
          ),
        );
      }
      if (currentID != null) {
        players.update(
          currentID!,
          (value) => value.copyWith(pts: (value.pts ?? 0) + 1),
        );
      }
    } else {
      for (MapEntry<String, LocalIcon> e in clickedIcons) {
        icons.update(
          e.key,
          (value) => value.copyWith(isCheck: false),
        );
      }
    }
    return validate;
  }

  String? get nextID {
    final int index = players[currentID]?.playerNo ?? 0;
    if (index + 1 == players.length) return players.keys.first;
    return players.keys.elementAt(index + 1);
  }

  List<String> get winners {
    if (players.isEmpty) return [];
    final Map<String, LocalPlayer> sortWinner = SplayTreeMap.from(
      players,
      (a, b) {
        final int x = players[a]!.pts ?? 0;
        final int y = players[b]!.pts ?? 0;
        return y.compareTo(x);
      },
    );

    return sortWinner.keys
        .where((key) => sortWinner[key]?.pts == sortWinner.values.first.pts)
        .toList();
  }

  bool get everyIconFound =>
      icons.values.every((value) => value.isFound ?? false);

  FriendlyStats friendlyStats(String id) => FriendlyStats(
        pts: players[id]?.pts ?? 0,
        type: type,
        count: players.length > 2 ? PlayerCount.trio : PlayerCount.vs,
        level: icons.length == 56 ? BoardLevel.hard : BoardLevel.easy,
        winner: winners.contains(id),
      );
}
