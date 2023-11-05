import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_avatar.freezed.dart';
part 'my_avatar.g.dart';

@freezed
class MyAvatar with _$MyAvatar {
  const MyAvatar._();

  const factory MyAvatar({
    required DateTime createdAt,
    required String createdBy,
    @Default("") String id,
  }) = _MyAvatar;

  factory MyAvatar.fromJson(Map<String, dynamic> json) =>
      _$MyAvatarFromJson(json);

  Map<String, dynamic> toIdJson(String id) => toJson();
}
