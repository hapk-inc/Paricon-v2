import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../values/colors.dart';
import 'color_converter.dart';

part 'local_icon.freezed.dart';
part 'local_icon.g.dart';

@freezed
class LocalIcon extends Equatable with _$LocalIcon {
  const LocalIcon._();

  @JsonSerializable(includeIfNull: false)
  const factory LocalIcon({
    @ColorConverter() @Default(majorelleBlue) Color? color,
    String? audio,
    required int iconCode,
    required int iconNo,
    bool? isCheck,
    bool? isFound,
  }) = _LocalIcon;

  factory LocalIcon.fromJson(Map<String, dynamic> json) =>
      _$LocalIconFromJson(json);

  Map<String, dynamic> toIdJson(String id) => {id: toJson()};

  bool get checkFound => (isCheck ?? false) || (isFound ?? false);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is LocalIcon && runtimeType == other.runtimeType;
  }

  @override
  int get hashCode => 0;

  @override
  // TODO: implement props
  List<Object?> get props => [isCheck, isFound];
}
