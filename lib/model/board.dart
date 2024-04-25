import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

  int get checkCount =>
      icons.values.where((value) => value.isCheck ?? false).length;

  bool get validateIcon {
    Iterable<LocalIcon> x = icons.values.where((x) => x.isCheck ?? false);
    if (x.length != 2) return false;
    return x.every((e) => x.first.iconCode == e.iconCode);
  }

  bool updateIcon(bool isDailyMatch) {
    Iterable<MapEntry<String, LocalIcon>> x =
        icons.entries.where((x) => x.value.isCheck ?? false);

    bool v = validateIcon;

    if (v) {
      for (MapEntry<String, LocalIcon> e in x) {
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
      players.update(
          currentID!, (value) => value.copyWith(pts: (value.pts ?? 0) + 1));
    } else {
      for (MapEntry<String, LocalIcon> e in x) {
        icons.update(
          e.key,
          (value) => value.copyWith(isCheck: false),
        );
      }
    }

    return v;
  }

  factory Board.fromSnapshot(DataSnapshot snapshot) {
    Map map = snapshot.value as Map;
    Map<String, dynamic> json = Map<String, dynamic>.from(map);
    final Board board = Board.fromJson(json);
    return board;
  }

  bool get everyIcon => icons.values.every((value) => value.isFound ?? false);
}
