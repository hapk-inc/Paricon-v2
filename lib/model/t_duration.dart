import 'package:freezed_annotation/freezed_annotation.dart';

part 't_duration.freezed.dart';
part 't_duration.g.dart';

@freezed
class TDuration with _$TDuration {
  const factory TDuration({
    required String userId,
    required DateTime playedAt,
    required Duration tDuration,
    @Default(Duration.zero) Duration bestDifference,
    @Default(false) bool firstTime,
    @Default("public") String tourId,
  }) = _TDuration;

  factory TDuration.fromJson(Map<String, dynamic> json) =>
      _$TDurationFromJson(json);
}
