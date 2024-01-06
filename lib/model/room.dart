import 'package:freezed_annotation/freezed_annotation.dart';

import '../logic/room_level_notifier.dart';
import '../logic/room_type_notifier.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  const factory Room({
    @Default([]) List? players,
    @Default(false) bool isGameStarted,
    required num roomCode,
    required RoomLevel level,
    required String creatorID,
    required RoomType type,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
