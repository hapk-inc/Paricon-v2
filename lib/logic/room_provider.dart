import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/model/room.dart';

import 'auth_provider.dart';
import 'firebase_init.dart';
import 'room_database.dart';
import 'room_id.dart';
import 'room_level_notifier.dart';
import 'room_type_notifier.dart';

final AutoDisposeFutureProvider<String> createRoomProvider =
    FutureProvider.autoDispose<String>(
  (ref) async {
    try {
      if (!kDebugMode) {
        final package = await ref.read(packageInfoProvider.future);
        if (!package.appName.contains("Dev")) {
          final appUpdate = await ref.read(inAppUpdateProvider.future);
          if (appUpdate.updateAvailability ==
                  UpdateAvailability.updateAvailable &&
              appUpdate.immediateUpdateAllowed) return "UPDATE";
        }
      }

      final RoomLevel roomLevel = ref.watch(levelProvider);
      final RoomType roomType = ref.watch(typeProvider);

      final User user = ref.watch(authUserProvider).value!;

      final roomDatabase = ref.watch(roomDatabaseProvider);
      final String? key = await roomDatabase.createRoom(
        Room(
          roomCode: mockInteger(111111, 999999),
          level: roomLevel,
          creatorID: user.uid,
          type: roomType,
        ),
      );
      debugPrint("43--${key ?? "No Value"}");
      ref.read(idNotifier.notifier).state = key!;
      return key;
    } catch (e) {
      debugPrint(e.toString());
      return "";
    }
  },
);

final AutoDisposeFutureProvider joinRoomProvider = FutureProvider.autoDispose(
  (ref) async {
    final roomDatabase = ref.read(roomDatabaseProvider);

    final User user = ref.read(authUserProvider).value!;
    await roomDatabase.joinRoom(user);
  },
);

final AutoDisposeFutureProvider<Room> roomProvider =
    FutureProvider.autoDispose<Room>(
  (ref) async {
    final roomDatabase = ref.watch(roomDatabaseProvider);
    final Room room = await roomDatabase.hostRoom;
    //  ref.maintainState = false;
    return room;
  },
);

final AutoDisposeFutureProviderFamily<dynamic, String> validateCodeProvider =
    FutureProvider.autoDispose.family<dynamic, String>(
  (ref, code) async {
    final roomDatabase = ref.watch(roomDatabaseProvider);
    return roomDatabase.validateCode(code);
    //  ref.maintainState = false;
    //return room;
  },
);

final AutoDisposeStreamProvider<bool> sGameStartProvider =
    StreamProvider.autoDispose<bool>(
  (ref) {
    final roomDatabase = ref.read(roomDatabaseProvider);
    return roomDatabase.sGameStart;
  },
);

final AutoDisposeFutureProvider gameStartProvider = FutureProvider.autoDispose(
  (ref) async {
    try {
      final roomDatabase = ref.read(roomDatabaseProvider);
      await roomDatabase.gameStart(true);
    } catch (e) {}
  },
);
