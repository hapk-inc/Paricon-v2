import 'package:freezed_annotation/freezed_annotation.dart';

part 't_score.g.dart';
part 't_score.freezed.dart';

@freezed
class TScore with _$TScore {
  const factory TScore({
    String? userId,
    DateTime? playedAt,
    Duration? tDuration,
  }) = _TScore;

  factory TScore.fromJson(Map<String, dynamic> json) => _$TScoreFromJson(json);
}
