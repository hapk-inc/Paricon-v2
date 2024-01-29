import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../logic/room_type_notifier.dart';
import 'local_icon.dart';
import 'local_player.dart';

part 'board.freezed.dart';
part 'board.g.dart';

@freezed
class Board with _$Board {
  const Board._();

  const factory Board({
    @Default({}) Map<String, LocalPlayer> players,
    @Default({}) Map<String, LocalIcon> icons,
    required String currentID,
    @Default(RoomType.normal) RoomType type,
    String? currentIcon,
  }) = _Board;

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

  Map<String, LocalPlayer> get winners {
    final List<LocalPlayer> x = players.values.toList();
    x.sort((a, b) => b.pts.compareTo(a.pts));

    final List<LocalPlayer> winners =
        List<LocalPlayer>.from(x).where((i) => i.pts == x.first.pts).toList();

    final newX = Map<String, LocalPlayer>.from(players);
    newX.removeWhere((key, value) => !winners.contains(value));
    return newX;
  }
}
