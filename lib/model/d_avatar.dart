import 'package:freezed_annotation/freezed_annotation.dart';

part 'd_avatar.freezed.dart';
part 'd_avatar.g.dart';

@freezed
class DAvatar with _$DAvatar {
  const factory DAvatar({
    required DateTime createdAt,
    String? avatar,
  }) = _DAvatar;

  factory DAvatar.fromJson(Map<String, dynamic> json) =>
      _$DAvatarFromJson(json);
}
