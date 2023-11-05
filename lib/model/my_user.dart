import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_user.freezed.dart';
part 'my_user.g.dart';

@freezed
class MyUser with _$MyUser {
  const factory MyUser({
    required String name,
    @Default("") String rName,
    required num id,
    String? avatar,
    String? avatarCode,
    @Default(true) bool isActive,
    String? playing,
    @Default(true) bool isHuman,
    //num? controllerCount,
    DateTime? createdAt,
    @Default([]) List<String> myCards,
    Duration? bestDuration,
    @Default(0) num tournamentPlayed,
    //List<String>? controlledBy,
  }) = _MyUser;

  factory MyUser.fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);
}
