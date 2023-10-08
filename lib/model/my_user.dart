import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_user.freezed.dart';
part 'my_user.g.dart';

@freezed
class MyUser with _$MyUser {
  const factory MyUser(
      {required String name,
      @Default("") String rName,
      required num id,
      required String avatar,
      required bool isActive,
      String? playing,
      required bool isHuman,
      num? controllerCount,
      List<String>? controlledBy}) = _MyUser;

  factory MyUser.fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);
}
