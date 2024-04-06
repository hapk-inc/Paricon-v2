import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';
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
}
