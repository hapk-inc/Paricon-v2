import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'play_stats.dart';

part 'local_player.freezed.dart';
part 'local_player.g.dart';

@freezed
class LocalPlayer with _$LocalPlayer {
  const LocalPlayer._();

  const factory LocalPlayer({
    required String name,
    required String color,
    @Default("") String avatar,
    @Default(0) int pts,
    required int playerNo,
    @Default(false) bool isActive,
  }) = _LocalPlayer;

  factory LocalPlayer.fromJson(Map<String, dynamic> json) =>
      _$LocalPlayerFromJson(json);

  PlayStats statsConversion(int totalIcons, bool winner, List<String> players) {
    final int totalPts = totalIcons ~/ 2;
    final double avg = (pts / totalPts) * 100;

    final Map<String, num> x = players.fold({}, (prev, m) {
      prev[m] = 1;
      return prev;
    });

    return PlayStats(matches: 1, win: winner ? 1 : 0, avg: avg, players: x);
  }
}
