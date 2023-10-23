import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar_card.freezed.dart';
part 'avatar_card.g.dart';

@freezed
class AvatarCard with _$AvatarCard {
  const AvatarCard._();

  const factory AvatarCard({
    required DateTime createdAt,
    required String createdBy,
    @Default("") String id,
  }) = _AvatarCard;

  factory AvatarCard.fromJson(Map<String, dynamic> json) =>
      _$AvatarCardFromJson(json);

  Map<String, dynamic> toIdJson(String id) => toJson();
}
