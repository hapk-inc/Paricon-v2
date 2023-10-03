import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_duration.freezed.dart';
part 'my_duration.g.dart';

@freezed
class MyDuration with _$MyDuration {
  const factory MyDuration({
    DateTime? lastOpened,
    DateTime? lastGamePlayed,
    required DateTime currentTime,
  }) = _MyDuration;

  factory MyDuration.fromJson(Map<String, dynamic> json) =>
      _$MyDurationFromJson(json);
}
