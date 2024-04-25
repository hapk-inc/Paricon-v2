import 'package:json_annotation/json_annotation.dart';

import 'player.dart';

class PlayerConverter implements JsonConverter<Map<String, Player>, Map> {
  const PlayerConverter();

  @override
  Map<String, Player> fromJson(Map<dynamic, dynamic> json) =>
      Map<String, dynamic>.from(json).map(
        (k, e) => MapEntry(
          k,
          Player.fromJson(Map<String, dynamic>.from(e)),
        ),
      );

  @override
  Map toJson(Map<String, Player> object) {
    Map map = {};
    object.forEach((key, value) => map[key] = value.toJson());
    return map;
  }
}
