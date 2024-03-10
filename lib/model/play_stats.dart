import 'package:freezed_annotation/freezed_annotation.dart';

part 'play_stats.freezed.dart';
part 'play_stats.g.dart';

@freezed
class PlayStats with _$PlayStats {
  const PlayStats._();

  const factory PlayStats({
    @Default(0) int matches,
    @Default(0) int win,
    @Default(0.00) double avg,
    @Default({}) Map<String, num> players,
  }) = _PlayStats;

  factory PlayStats.fromJson(Map<String, dynamic> json) =>
      _$PlayStatsFromJson(json);

  PlayStats operator +(PlayStats stats) {
    double newAvg = stats.avg - avg;
    newAvg = newAvg / (matches + 1);
    newAvg = avg + newAvg;
    newAvg = double.parse(newAvg.toStringAsFixed(2));
    return PlayStats(
        matches: (matches + 1), win: (win + stats.win), avg: newAvg);
  }
}
