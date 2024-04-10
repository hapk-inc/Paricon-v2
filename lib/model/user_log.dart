import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_log.freezed.dart';
part 'user_log.g.dart';

@freezed
class UserLog with _$UserLog {
  @JsonSerializable(includeIfNull: false)
  const factory UserLog({
    required String id,
    required DateTime when,
    required Duration timeTaken,
    String? tournament,
  }) = _UserLog;

  factory UserLog.fromJson(Map<String, dynamic> json) =>
      _$UserLogFromJson(json);
}
