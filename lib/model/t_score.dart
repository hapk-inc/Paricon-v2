import 'package:freezed_annotation/freezed_annotation.dart';

part 't_score.freezed.dart';
part 't_score.g.dart';

@freezed
class TScore with _$TScore {
  const factory TScore({
    required String userId,
    required DateTime playedAt,
    required Duration tDuration,
  }) = _TScore;

  factory TScore.fromJson(Map<String, dynamic> json) => _$TScoreFromJson(json);
}
