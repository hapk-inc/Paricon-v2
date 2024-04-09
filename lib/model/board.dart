import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';
import '../values/colors.dart';
import 'local_icon.dart';
import 'local_player.dart';

part 'board.freezed.dart';
part 'board.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Board with _$Board {
  const Board._();

  @JsonSerializable(includeIfNull: false)
  const factory Board({
    @Default({}) Map<String, LocalPlayer> players,
    @Default({}) Map<String, LocalIcon> icons,
    required String currentID,
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
            color: majorelleBlue,
          ),
        );
      }
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

  bool get everyIcon => icons.values.every((value) => value.isCheck ?? false);
}
