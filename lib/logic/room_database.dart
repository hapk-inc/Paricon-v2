//import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../logic/room_id.dart';

import '../model/my_user.dart';
import '../model/room.dart';
import 'auth_provider.dart';
import 'firebase_init.dart';
import 'validate_room.dart';

final Provider<RoomDatabase> roomDatabaseProvider = Provider(
  (ref) {
    final String id = ref.watch(idNotifier);
    return RoomDatabase(ref, id: id);
  },
);

class RoomDatabase {
  final Ref ref;
  final String? id;

  late DatabaseReference firebaseReference;

  late String? userId;
  late DatabaseReference roomReference;
  //late DocumentReference userDoc;

  RoomDatabase(this.ref, {this.id}) {
    firebaseReference = ref.read(databaseProvider).ref();

    userId = ref.watch(authUserProvider).value!.uid;

    roomReference = id == null
        ? firebaseReference.child('rooms')
        : firebaseReference.child('rooms/${id!}');
  }

  Future<String?> createRoom(Room room) async {
    String? key = firebaseReference.child('rooms').push().key;
    debugPrint("47-- $key");

    await firebaseReference.child('rooms').child(key!).set(room.toJson());
    return key;
  }

  Stream<Room?> get sGameRoom {
    late StreamController<Room?> controller;
    controller = StreamController<Room?>(
      onListen: id == null || (id ?? "").isEmpty
          ? null
          : () => roomReference.onValue.listen(
                (event) {
                  if (event.snapshot.exists) {
                    Map map = event.snapshot.value as Map;
                    Map<String, dynamic> json = Map<String, dynamic>.from(map);
                    if (id == null || (id ?? "").isEmpty) controller.close();

                    if (json.isNotEmpty) {
                      final Room room = Room.fromJson(json);
                      controller.add(room);
                      if (room.players.isEmpty) controller.close();
                    }
                  }
                },
              ),
    );
    return controller.stream;
  }

  Future<dynamic> validateCode(String roomCode) {
    num roomCode0 = num.parse(roomCode);
    return firebaseReference
        .child('rooms')
        .orderByChild("roomCode")
        .equalTo(roomCode0)
        .once()
        .then(
      (databaseEvent) {
        if (databaseEvent.snapshot.exists) {
          Map a = databaseEvent.snapshot.value as Map;

          if (a.length != 1) {
            return ValidateRoom.duplicateCode;
          }
          Map<String, dynamic> map = Map<String, dynamic>.from(a.values.first);

          final Room room = Room.fromJson(map);
          if (room.players.length >= 3) {
            return ValidateRoom.duplicateCode;
          }
          if (room.isGameStarted) {
            return ValidateRoom.gameAlreadyStarted;
          }
          return a.keys.first;
        } else {
          return ValidateRoom.noCode;
        }
      },
    );
  }

  Future get leaveRoom => roomReference.child('players/$userId').remove();

  Future joinRoom(User user, MyUser myUser) async {
    Map map = {
      "isActive": true,
      "timestamp": DateTime.now().millisecondsSinceEpoch,
      "name": myUser.name,
      "avatar": myUser.avatar,
    };

    return roomReference.child('players/${user.uid}').set(map);

    /* await roomReference.child('players').runTransaction(
      (Object? transactionHandler) {
        if (transactionHandler == null) {
          debugPrint("Null Transaction");
          return Transaction.success([user.uid]);
        } else {
          debugPrint("No Null Transaction");
          List a = List.from(transactionHandler as List, growable: true);
          a.add(user.uid);
          return Transaction.success(a);
        }
        //transactionHandler
      },
    );*/
  }

  Stream<bool> get sGameStart {
    late StreamController<bool> controller;
    controller = StreamController<bool>(
      onListen: () => roomReference.child('isGameStarted').onValue.listen(
        (event) {
          var check = event.snapshot.value;
          if (check is bool) {
            controller.add(check);
            if (check) controller.close();
          }
        },
      ),
    );
    return controller.stream;
  }

  Future gameStart(bool bool) => roomReference.child('isGameStarted').set(true);
}
