import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../firebase/bloc.dart';
import '../../model/player.dart';
import '../../model/room.dart';
import '../auth/notifier.dart';
import '../user/bloc.dart';
import '../user/notifier.dart';
import 'id.dart';

final Provider<RoomDatabase> roomDatabaseProvider = Provider(
  (ref) {
    return RoomDatabase(ref);
  },
);

class RoomDatabase {
  final Ref<RoomDatabase> ref;

  late DatabaseReference firebaseReference;
  late DatabaseReference roomReference;
  late String? id;

  RoomDatabase(this.ref) {
    firebaseReference = ref.read(databaseProvider).ref();
    roomReference = firebaseReference.child('rooms');
    id = ref.watch(idNotifier);
  }

  Future<String?> createRoom(Room room) async {
    String? key = roomReference.push().key;
    await roomReference.child(key!).set(room.toJson());
    return key;
  }

  Future get joinRoom async {
    final AuthNotifier authNotifier = ref.read(authNotifierProvider);
    final UserNotifier userNotifier = ref.read(userNotifierProvider);

    if (id != null && authNotifier.fUser != null && userNotifier.me != null) {
      return roomReference
          .child(id!)
          .child('players/${authNotifier.fUser!.uid}')
          .set(Player(
                  name: userNotifier.me?.name ?? "",
                  createdAt: DateTime.now(),
                  avatar: userNotifier.me?.avatar)
              .toJson());
    }
  }
}
