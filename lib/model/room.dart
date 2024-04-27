import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';
import 'player.dart';
import 'player_converter.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  const Room._();

  @JsonSerializable(includeIfNull: false)
  const factory Room({
    @PlayerConverter() @Default({}) Map<String, Player>? players,
    bool? started,
    num? code,
    @Default(BoardLevel.easy) BoardLevel? level,
    String? creator,
    @Default(BoardType.normal) BoardType? type,
    @Default(PlayerCount.vs) PlayerCount? count,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  factory Room.fromSnapshot(DataSnapshot snapshot) {
    Map map = snapshot.value as Map;
    Map<String, dynamic> json = Map<String, dynamic>.from(map);
    final Room room = Room.fromJson(json);
    return room;
  }

  bool get notNull => level != null && type != null && count != null;
}
