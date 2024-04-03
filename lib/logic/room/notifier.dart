import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/panel/dashboard_bloc.dart';

import '../../enums/enums.dart';
import '../../model/room.dart';
import '../auth/bloc.dart';
import 'bloc.dart';
import 'id.dart';

class RoomNotifier extends ChangeNotifier {
  final Ref ref;
  late Room? room;

  RoomNotifier(this.ref) {
    final String? id = ref.watch(idNotifier);

    if (id == null) {
      room = createRoom;
      ref.read(createRoomProvider(room!));
    } else {}
    //room = id == null ? createRoom : ref.watch(roomProvider).value;
  }

  Room get createRoom {
    final String id = ref.read(authUserProvider).value?.uid ?? "";
    final BoardLevel level = BoardLevel
        .values[ref.read(boardLevelGroupControllerProvider).selectedIndex ?? 0];

    final BoardType type = BoardType
        .values[ref.read(boardTypeGroupControllerProvider).selectedIndex ?? 0];

    return Room(
      code: mockInteger(100000, 999999),
      level: level,
      creator: id,
      type: type,
    );
  }
}
