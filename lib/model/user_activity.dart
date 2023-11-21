import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_activity.freezed.dart';
part 'user_activity.g.dart';

@freezed
class UserActivity with _$UserActivity {
  const UserActivity._();

  const factory UserActivity({
    DateTime? lastOpened,
    DateTime? lastGamePlayed,
    @Default(true) bool isActive,
    @Default(false) bool isPlaying,
    String? name,
    String? avatar,
    String? appVersion,
    required DateTime nowTime,
  }) = _UserActivity;

  factory UserActivity.fromJson(Map<String, dynamic> json) =>
      _$UserActivityFromJson(json);
}
