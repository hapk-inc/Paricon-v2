import 'package:firebase_database/firebase_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../logic/room_level_notifier.dart';
import '../logic/room_type_notifier.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  const factory Room({
    @Default({}) Map players,
    @Default(false) bool isGameStarted,
    required num roomCode,
    required RoomLevel level,
    required String creatorID,
    required RoomType type,
    @Default("") String nextRoom,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  factory Room.fromSnapshot(DataSnapshot snapshot) {
    Map map = snapshot.value as Map;
    Map<String, dynamic> json = Map<String, dynamic>.from(map);
    final Room room = Room.fromJson(json);
    return room;
  }
}

/*
* _$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      players: json.containsKey('players')
          ? (json['players'] as Map).keys.toList()
          : [],
      isGameStarted: json['isGameStarted'] as bool? ?? false,
      roomCode: json['roomCode'] as num,
      level: $enumDecode(_$RoomLevelEnumMap, json['level']),
      creatorID: json['creatorID'] as String,
      type: $enumDecode(_$RoomTypeEnumMap, json['type']),
    );*/
