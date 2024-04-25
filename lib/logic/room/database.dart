import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rxdart/rxdart.dart';

import '../../firebase/bloc.dart';
import '../../model/player.dart';
import '../../model/room.dart';
import '../auth/bloc.dart';
import '../user/bloc.dart';

class RoomDatabase {
  final Ref ref;
  final String? id;

  late DatabaseReference firebaseReference;
  late DatabaseReference roomReference;

  RoomDatabase(this.ref, [this.id]) {
    firebaseReference = ref.read(databaseProvider).ref();
    roomReference = firebaseReference.child('rooms');
  }

  Future get gameStart => roomReference.child(id!).update({
        "started": true,
      });

  Future<String?> createRoom(Room room) async {
    String? key = roomReference.push().key;
    await roomReference
        .child(key!)
        .set(room.toJson())
        .then((value) => joinRoom(key));
    return key;
  }

  Future joinRoom(String room) async {
    final String id = ref.read(authUserProvider).value!.uid;
    final Player player = ref.read(meProvider).value!;
    return roomReference
        .child(room)
        .child('players')
        .child(id)
        .set(player.toJson());
  }

  Stream<Room?> get hostRoom {
    late BehaviorSubject<Room?> subject;
    subject = BehaviorSubject<Room?>(
      onListen: id == null
          ? null
          : () => roomReference.child(id!).onValue.listen(
                (event) {
                  if (event.snapshot.exists) {
                    if (event.snapshot.value != null) {
                      debugPrint("52--");
                      Room room = Room.fromSnapshot(event.snapshot);
                      subject.add(room);
                    } else {
                      subject.close();
                    }
                  }
                },
              ),
    );
    return subject.stream;
  }

  Future updateRoom(Room room) =>
      roomReference.child(id!).update(room.toJson());
}
