import 'package:firebase_database/firebase_database.dart';
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
    @Default(false) dynamic isPlaying,
    String? name,
    String? avatar,
    String? appVersion,
    required DateTime nowTime,
    @Default(false) bool isEmulator,
  }) = _UserActivity;

  factory UserActivity.fromJson(Map<String, dynamic> json) =>
      _$UserActivityFromJson(json);

  UserActivity newUpdate(String version) {
    final now = DateTime.now();
    final UserActivity userActivity =
        copyWith(nowTime: now, lastOpened: nowTime, appVersion: version);
    return userActivity;
  }

  factory UserActivity.fromSnapshot(DataSnapshot snapshot) {
    final Map map = snapshot.value as Map;
    final Map<String, dynamic> json = Map<String, dynamic>.from(map);
    return UserActivity.fromJson(json);
  }
}
