import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/room.dart';
import 'database.dart';

final AutoDisposeFutureProviderFamily<String?, Room> createRoomProvider =
    FutureProvider.autoDispose.family<String?, Room>(
  (ref, room) async {
    final RoomDatabase roomDatabase = ref.read(roomDatabaseProvider);
    return roomDatabase.createRoom(room);
  },
);

final AutoDisposeFutureProvider joinRoomProvider = FutureProvider.autoDispose(
  (ref) async {
    final roomDatabase = ref.read(roomDatabaseProvider);
    return roomDatabase.joinRoom;
  },
);

final AutoDisposeFutureProvider leaveRoomProvider = FutureProvider.autoDispose(
  (ref) async {
    /*final roomDatabase = ref.read(roomDatabaseProvider);
    return roomDatabase.leaveRoom;*/
  },
);

final StreamProvider<Room?> roomProvider = StreamProvider<Room?>(
  (ref) async* {},
);

/*final AutoDisposeStreamProvider<Room?> roomProvider =
    StreamProvider.autoDispose<Room?>(
  (ref) {
    */ /*final roomDatabase = ref.watch(roomDatabaseProvider);
    return roomDatabase.sGameRoom;*/ /*
  },
);*/

final AutoDisposeFutureProviderFamily<dynamic, String> validateCodeProvider =
    FutureProvider.autoDispose.family<dynamic, String>(
  (ref, code) async {
    /*final roomDatabase = ref.watch(roomDatabaseProvider);
    return roomDatabase.validateCode(code);*/
    //  ref.maintainState = false;
    //return room;
  },
);

/*final AutoDisposeStreamProvider<bool> sGameStartProvider =
    StreamProvider.autoDispose<bool>(
  (ref) {
    */ /*final roomDatabase = ref.read(roomDatabaseProvider);
    return roomDatabase.sGameStart;*/ /*
  },
);*/

/*final AutoDisposeFutureProvider gameStartProvider = FutureProvider.autoDispose(
  (ref) async {
    */ /*final roomDatabase = ref.read(roomDatabaseProvider);
    await roomDatabase.gameStart(true);*/ /*
  },
);*/
