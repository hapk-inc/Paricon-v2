import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_icon.freezed.dart';
part 'local_icon.g.dart';

@freezed
class LocalIcon with _$LocalIcon {
  const LocalIcon._();

  const factory LocalIcon(
      {int? color,
      String? audio,
      required int iconCode,
      required int iconNo,
      @Default(false) bool isCheck,
      @Default(false) bool isFound}) = _LocalIcon;

  factory LocalIcon.fromJson(Map<String, dynamic> json) =>
      _$LocalIconFromJson(json);

  Map<String, dynamic> toIdJson(String id) => {id: toJson()};

  bool get checkFound => isCheck || isFound;
}
