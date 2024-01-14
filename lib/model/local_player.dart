import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_player.freezed.dart';
part 'local_player.g.dart';

@freezed
class LocalPlayer with _$LocalPlayer {
  const factory LocalPlayer({
    required String name,
    required String color,
    @Default("") String avatar,
    @Default(0) int pts,
    required int playerNo,
    @Default(false) bool isActive,
  }) = _LocalPlayer;

  factory LocalPlayer.fromJson(Map<String, dynamic> json) =>
      _$LocalPlayerFromJson(json);
}
