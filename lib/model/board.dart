import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'local_icon.dart';
import 'local_player.dart';

part 'board.freezed.dart';
part 'board.g.dart';

@freezed
class Board with _$Board {
  const factory Board({
    @Default({}) Map<String, LocalPlayer> players,
    @Default({}) Map<String, LocalIcon> icons,
    required String currentID,
    required String type,
    String? currentIcon,
  }) = _Board;

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);
}
