import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';

import 'local_player.dart';

class LocalPlayerConverter
    implements JsonConverter<Map<String, LocalPlayer>, Map> {
  const LocalPlayerConverter();

  @override
  Map<String, LocalPlayer> fromJson(Map<dynamic, dynamic> json) {
    final Map<String, LocalPlayer> map = Map<String, dynamic>.from(json).map(
      (k, e) => MapEntry(
        k,
        LocalPlayer.fromJson(Map<String, dynamic>.from(e)),
      ),
    );

    return SplayTreeMap.from(
      map,
      (a, b) {
        final int x = map[a]!.playerNo ?? 0;
        final int y = map[b]!.playerNo ?? 0;
        return x.compareTo(y);
      },
    );
  }

  @override
  Map toJson(Map<String, LocalPlayer> object) {
    Map map = {};
    object.forEach((key, value) => map[key] = value.toJson());
    return map;
  }
}
