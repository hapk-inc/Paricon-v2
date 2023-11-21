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
    DateTime? createdAt,
    @Default([]) List<String> avatarArr,
    @Default([]) List<String> friendArr,
  }) = _MyUser;

  factory MyUser.fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);
}
