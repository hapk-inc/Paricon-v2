import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rxdart/rxdart.dart';

import '../../enums/enums.dart';
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
    await roomReference.child(key!).set(room.toJson());
    // .then((value) => joinRoom(key));
    return key;
  }

  Future get joinRoom async {
    debugPrint("Joining Room");
    final String user = ref.read(authUserProvider).value!.uid;
    final Player player = ref.read(meProvider).value!;
    return roomReference.child(id!).child('players').child(user).set(Player(
          name: player.name,
          createdAt: DateTime.now(),
          avatar: player.avatar,
        ).toJson());
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

  Future<dynamic> validateCode(String roomCode) async {
    num _roomCode = num.parse(roomCode);
    return roomReference.orderByChild("code").equalTo(_roomCode).once().then(
      (DatabaseEvent event) {
        if (event.snapshot.value == null) return ValidateRoom.notExists;

        //

        final Map map = event.snapshot.value as Map;

        if (map.length != 1) return ValidateRoom.duplicateCode;

        //
        final Room room =
            Room.fromJson(Map<String, dynamic>.from(map.values.first));
        debugPrint("82--$room");
        if (room.started ?? false) return ValidateRoom.alreadyStarted;

        switch (room.count ?? PlayerCount.vs) {
          case PlayerCount.vs:
            if (2 < room.players!.length) return ValidateRoom.houseFull;
          case PlayerCount.trio:
            if (3 < room.players!.length) return ValidateRoom.houseFull;
        }
        return map.keys.first ?? "";
      },
    );
  }
  /*Future updateRoom(Room room) =>
      roomReference.child(id!).update(room.toJson());*/
}
