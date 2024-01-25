import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/user_provider.dart';
import 'package:paricon/model/room.dart';

import '../model/local_icon.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';
import 'auth_provider.dart';
import 'board_database.dart';
import 'firebase_init.dart';
import 'game_setup_provider.dart';
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

    final MyUser myUser = ref.watch(myUserProvider).value!;
    return roomDatabase.joinRoom(user, myUser);
  },
);

final AutoDisposeFutureProvider leaveRoomProvider = FutureProvider.autoDispose(
  (ref) async {
    final roomDatabase = ref.read(roomDatabaseProvider);
    return roomDatabase.leaveRoom;
  },
);

/*final AutoDisposeFutureProvider<Room?> roomProvider =
    FutureProvider.autoDispose<Room?>(
  (ref) async {
    final roomDatabase = ref.watch(roomDatabaseProvider);
    final Room? room = await roomDatabase.hostRoom;
    //  ref.maintainState = false;
    return room;
  },
);*/

final AutoDisposeStreamProvider<Room?> roomProvider =
    StreamProvider.autoDispose<Room?>(
  (ref) {
    final roomDatabase = ref.read(roomDatabaseProvider);
    return roomDatabase.sGameRoom;
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
    final roomDatabase = ref.read(roomDatabaseProvider);
    await roomDatabase.gameStart(true);
  },
);

final AutoDisposeProvider<List<Color>> gridColorRandomColorProvider =
    Provider.autoDispose(
  (ref) {
    List<Color> x = List.from(gridColor);
    x.shuffle();
    return x;
  },
);

final AutoDisposeFutureProvider<bool> createBoardProvider =
    FutureProvider.autoDispose(
  (ref) async {
    try {
      final Room room = ref.read(roomProvider).value!;
      //final details = room.details;

      //final Map playersProvider = await ref.read(roomPlayersProvider!.future);

      if (!kDebugMode) {
        final package = await ref.read(packageInfoProvider.future);
        if (!package.appName.contains("Dev") && room.players.length == 1) {
          return false;
        }
      }

      final players = convertToBoard(room.players);
      //final players = {};

      final GameSetup setup = ref.read(setupProvider);
      final List<LocalIcon> localIcons = setup.newIcons;
      final Map icons = localIcons.map((e) => e.toIdJson(mockString(12))).fold(
        {},
        (previousValue, element) => {...previousValue, ...element},
      );

      String currentIcon = "";
      if (room.type.name == "orderWise") {
        //final localIcon = localIcons[Random.secure().nextInt(localIcons.length)];
        //_currentIcon = localIcon.iconCode;
        // print("Current Icon is $_currentIcon");
      }

      final Map currentPlayer = {"currentID": room.players.keys.first};
      //final Map currentPlayer = {};

      final Map map = {
        ...{"players": players},
        ...{"icons": icons},
        ...currentPlayer,
        ...{"type": "normal"},
        if (currentIcon.isNotEmpty) ...{"currentIcon": currentIcon},
      };

      final boardDatabase = ref.read(boardDatabaseProvider);
      await boardDatabase.createBoard(map);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  },
);

Map convertToBoard(Map map) {
  List<int> playerOrder = List.generate(map.length, (index) => index + 1)
    ..shuffle();

  Map a = Map.from(map);

  List<String> colorNames = ['green', 'yellow', 'blue']..shuffle();
  int i = 0;
  a.updateAll(
    (key, value) {
      Map<dynamic, dynamic> localPlayer = value;
      localPlayer.remove("timestamp");
      localPlayer["playerNo"] = playerOrder[i];
      localPlayer["color"] = colorNames[i];

      i++;
      return localPlayer;
    },
  );

  return a;

  /*return players.fold<Map<String, dynamic>>(
    {},
    (m, element) {
      int index = players.indexOf(element);
      m[element] = {
        'playerNo': playerOrder[index],
        'color': colorNames[index],
      };
      return m;
    },
  );*/
}
