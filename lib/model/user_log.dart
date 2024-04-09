import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_log.freezed.dart';
part 'user_log.g.dart';

@freezed
class UserLog with _$UserLog {
  @JsonSerializable(includeIfNull: false)
  const factory UserLog({
    String? id,
    required DateTime when,
    required Duration timeTaken,
    Duration? diff,
    @Default(false) bool? firstTime,
    String? tournament,
  }) = _UserLog;

  factory UserLog.fromJson(Map<String, dynamic> json) =>
      _$UserLogFromJson(json);
}
