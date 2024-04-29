import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';

part 'friendly_stats.freezed.dart';
part 'friendly_stats.g.dart';

@freezed
class FriendlyStats with _$FriendlyStats {
  const factory FriendlyStats({
    @Default(BoardLevel.easy) BoardLevel? level,
    @Default(BoardType.normal) BoardType? type,
    @Default(PlayerCount.vs) PlayerCount? count,
    @Default(0) int pts,
    @Default(false) bool winner,
  }) = _FriendlyStats;

  factory FriendlyStats.fromJson(Map<String, dynamic> json) =>
      _$FriendlyStatsFromJson(json);
}
