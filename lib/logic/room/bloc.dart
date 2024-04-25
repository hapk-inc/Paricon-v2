import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';

import '../../model/room.dart';
import '../auth/bloc.dart';
import 'create_room.dart';
import 'database.dart';
import 'id.dart';
import 'notifier.dart';

/*final ChangeNotifierProvider<RoomNotifier> roomNotifierProvider =
    ChangeNotifierProvider<RoomNotifier>(
  (ref) => RoomNotifier(ref),
);*/

final StateNotifierProvider<RoomIdNotifier, String?> idNotifier =
    StateNotifierProvider<RoomIdNotifier, String?>(
  (ref) => RoomIdNotifier(),
);

final Provider<RoomDatabase> roomDatabaseProvider = Provider(
  (ref) {
    final String? id = ref.watch(idNotifier);
    return RoomDatabase(ref, id);
  },
);

final AutoDisposeFutureProvider<String?> createRoomProvider =
    FutureProvider.autoDispose<String?>(
  (ref) async {
    final RoomDatabase roomDatabase = ref.read(roomDatabaseProvider);
    final room = ref.read(createRoomNotifierProvider);
    final String? creator = ref.read(authUserProvider).value?.uid;
    final String? id = await roomDatabase.createRoom(
      room.copyWith(
        code: mockInteger(100000, 999999),
        creator: creator,
      ),
    );
    ref.read(idNotifier.notifier).state = id;
    return id;
  },
);

final AutoDisposeFutureProviderFamily updateRoomProvider =
    FutureProvider.autoDispose.family<void, Room>(
  (ref, room) async {
    final roomDatabase = ref.read(roomDatabaseProvider);
    return roomDatabase.updateRoom(room);
  },
);

final StreamProvider<Room?> roomProvider = StreamProvider<Room?>(
  (ref) {
    final roomDatabase = ref.watch(roomDatabaseProvider);
    return roomDatabase.hostRoom;
  },
);

final AutoDisposeFutureProvider setGameRoomStartProvider =
    FutureProvider.autoDispose<void>(
  (ref) async {
    final roomDatabase = ref.read(roomDatabaseProvider);
    return roomDatabase.gameStart;
  },
);
