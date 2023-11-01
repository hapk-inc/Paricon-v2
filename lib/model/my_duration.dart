import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_duration.freezed.dart';
part 'my_duration.g.dart';

@freezed
class MyDuration with _$MyDuration {
  const MyDuration._();

  const factory MyDuration({
    DateTime? lastOpened,
    DateTime? lastGamePlayed,
    String? avatarCode,
    String? appVersion,
    required DateTime currentTime,
  }) = _MyDuration;

  factory MyDuration.fromJson(Map<String, dynamic> json) =>
      _$MyDurationFromJson(json);

  bool get isCurrentTimeSameTime {
    final now = DateTime.now();
    return now.difference(currentTime) < const Duration(seconds: 1);
  }

  bool get onlyCurrentTime => lastOpened == null && appVersion == null;
}
