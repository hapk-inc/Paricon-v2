import 'package:freezed_annotation/freezed_annotation.dart';

part 'p_user.freezed.dart';
part 'p_user.g.dart';

@freezed
class PUser with _$PUser {
  const PUser._();
  const factory PUser({
    required String name,
    @Default("") String rName,
    required num id,
    String? avatar,
    @Default(true) bool isActive,
    String? playing,
    DateTime? createdAt,
    Duration? bestDuration,
    DateTime? currentTime,
    @Default(0) num tournamentPlayed,
    @Default([]) List<String> myFriends,
  }) = _PUser;

  factory PUser.fromJson(Map<String, dynamic> json) => _$PUserFromJson(json);

  /*Map<String, String> get xtoJson => {
        ...myUser.toJson(),
        ...myDuration.toJson(),
      };*/
}
