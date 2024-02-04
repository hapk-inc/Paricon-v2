import 'package:freezed_annotation/freezed_annotation.dart';

part 'pass_avatar.freezed.dart';
part 'pass_avatar.g.dart';

@freezed
class PassAvatar with _$PassAvatar {
  const factory PassAvatar(
      {required DateTime createdAt,
      String? avatar,
      required String from,
      required String to}) = _PassAvatar;

  factory PassAvatar.fromJson(Map<String, dynamic> json) =>
      _$PassAvatarFromJson(json);
}
