import 'package:firebase_database/firebase_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';
import 'player.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  @JsonSerializable(includeIfNull: false)
  const factory Room({
    @Default({}) Map<String, Player> players,
    bool? started,
    required num code,
    required BoardLevel level,
    required String creator,
    required BoardType type,
    required PlayerCount count,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  factory Room.fromSnapshot(DataSnapshot snapshot) {
    Map map = snapshot.value as Map;
    Map<String, dynamic> json = Map<String, dynamic>.from(map);
    final Room room = Room.fromJson(json);
    return room;
  }
}
