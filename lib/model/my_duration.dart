import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'my_duration.freezed.dart';
part 'my_duration.g.dart';

@freezed
class MyDuration with _$MyDuration {
  const factory MyDuration({
    DateTime? lastOpened,
    required DateTime currentTime,
  }) = _MyDuration;

  factory MyDuration.fromJson(Map<String, dynamic> json) =>
      _$MyDurationFromJson(json);
}
