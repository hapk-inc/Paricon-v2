import 'package:firebase_database/firebase_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pass_avatar.freezed.dart';
part 'pass_avatar.g.dart';

@freezed
class PassAvatar with _$PassAvatar {
  const PassAvatar._();
  const factory PassAvatar(
      {required DateTime createdAt,
      String? avatar,
      required String from,
      required String to}) = _PassAvatar;

  factory PassAvatar.fromJson(Map<String, dynamic> json) =>
      _$PassAvatarFromJson(json);

  factory PassAvatar.fromSnapshot(DataSnapshot snapshot) {
    final Map map = snapshot.value as Map;
    final Map<String, dynamic> json = Map.from(map);
    PassAvatar passAvatar = PassAvatar.fromJson(json);
    return passAvatar;
  }
}
