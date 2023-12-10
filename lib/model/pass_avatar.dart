import 'package:freezed_annotation/freezed_annotation.dart';

part 'pass_avatar.freezed.dart';
part 'pass_avatar.g.dart';

@freezed
class PassAvatar with _$PassAvatar {
  const factory PassAvatar({
    required DateTime createdAt,
    @Default("") String id,
  }) = _PassAvatar;

  factory PassAvatar.fromJson(Map<String, dynamic> json) =>
      _$PassAvatarFromJson(json);
}
