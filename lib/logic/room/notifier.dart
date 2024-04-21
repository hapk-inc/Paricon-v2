import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/room.dart';
import 'id.dart';

final Provider<RoomNotifier> roomNotifierProvider = Provider<RoomNotifier>(
  (ref) => RoomNotifier(ref),
);

class RoomNotifier extends ChangeNotifier {
  final Ref ref;
  Room? room;

  RoomNotifier(this.ref) {
    final String? id = ref.watch(idNotifier);

    if (id == null) {
      //room = createRoom;
      //ref.read(createRoomProvider(room!));
    } else {}
    //room = id == null ? createRoom : ref.watch(roomProvider).value;
  }

/*  Room get createRoom {
    final String id = ref.read(authUserProvider).value?.uid ?? "";
    final BoardLevel level = BoardLevel.values[0];

    final BoardType type = BoardType.values[0];

    return Room(
      code: mockInteger(100000, 999999),
      level: level,
      creator: id,
      type: type,
    );
  }*/
}
