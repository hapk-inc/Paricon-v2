import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../values/colors.dart';
import 'color_converter.dart';

part 'local_player.freezed.dart';
part 'local_player.g.dart';

@freezed
class LocalPlayer with _$LocalPlayer {
  const LocalPlayer._();

  @JsonSerializable(includeIfNull: false)
  const factory LocalPlayer({
    required String name,
    @JsonKey(name: "color")
    @ColorConverter()
    @Default(majorelleBlue)
    Color? color,
    String? avatar,
    @Default(0) int? pts,
    int? playerNo,
    bool? isActive,
  }) = _LocalPlayer;

  factory LocalPlayer.fromJson(Map<String, dynamic> json) =>
      _$LocalPlayerFromJson(json);
}
