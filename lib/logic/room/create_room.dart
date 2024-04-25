import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../enums/enums.dart';
import '../../model/room.dart';

final StateNotifierProvider<CreateRoomNotifier, Room>
    createRoomNotifierProvider =
    StateNotifierProvider<CreateRoomNotifier, Room>(
  (_) => CreateRoomNotifier(),
);

class CreateRoomNotifier extends StateNotifier<Room> {
  CreateRoomNotifier() : super(const Room());

  set type(BoardType value) => state = state.copyWith(type: value);

  set level(BoardLevel value) => state = state.copyWith(level: value);

  set count(PlayerCount value) => state = state.copyWith(count: value);
}
