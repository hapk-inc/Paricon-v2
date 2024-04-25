import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'local_icon.dart';

class LocalIconConverter implements JsonConverter<Map<String, LocalIcon>, Map> {
  const LocalIconConverter();

  @override
  Map<String, LocalIcon> fromJson(Map<dynamic, dynamic> json) {
    debugPrint("12--${json.length}");
    final Map<String, dynamic> map = Map<String, dynamic>.from(json).map(
      (k, e) => MapEntry(
        k,
        LocalIcon.fromJson(Map<String, dynamic>.from(e)),
      ),
    );
    debugPrint("18--$map");
    debugPrint("21--${map.length}");
    return SplayTreeMap.from(
      map,
      (a, b) => map[a]!.iconNo.compareTo(map[b]!.iconNo),
    );
  }

  @override
  Map toJson(Map<String, LocalIcon> object) {
    Map map = {};
    object.forEach((key, value) => map[key] = value.toJson());
    return map;
  }
}
