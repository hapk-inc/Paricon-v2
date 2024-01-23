import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paricon/logic/room_id.dart';
import 'package:rxdart/rxdart.dart';

import '../model/board.dart';
import '../model/local_icon.dart';
import '../model/local_player.dart';
import 'auth_provider.dart';
import 'firebase_init.dart';

final Provider<BoardDatabase> boardDatabaseProvider = Provider(
  (ref) {
    final String id = ref.watch(idNotifier);
    debugPrint("15--$id");
    return BoardDatabase(ref, id: id);
  },
);

class BoardDatabase {
  final Ref ref;
  final String id;

  late DatabaseReference firebaseReference;

  late String? userId;
  late DatabaseReference boardReference;
  late DatabaseReference boardIconReference;
  late DatabaseReference boardPlayerReference;

  BoardDatabase(this.ref, {this.id = ""}) {
    firebaseReference = ref.read(databaseProvider).ref();

    userId = ref.watch(authUserProvider).value!.uid;

    //Because of web, firebaseReference separate declaration
    boardReference = id.isEmpty
        ? firebaseReference.child('boards')
        : firebaseReference.child('boards/$id');

    boardIconReference = id.isEmpty
        ? firebaseReference.child('boards')
        : firebaseReference.child('boards/$id/icons');

    boardPlayerReference = id.isEmpty
        ? firebaseReference.child('boards')
        : firebaseReference.child('boards/$id/players');
  }

  Future createBoard(Map board) async {
    debugPrint("45--$id");
    return boardReference.set(board);
  }

  Future<Board?> get board async => id.isEmpty
      ? null
      : await boardReference.once().then(
          (DatabaseEvent event) {
            if (!event.snapshot.exists) {
              return null;
            }
            if (event.snapshot.value == null) return null;
            Map<String, dynamic> json =
                Map<String, dynamic>.from(event.snapshot.value as Map);

            Board board = Board.fromJson(json);
            return board;
          },
        );

  Stream<LocalIcon> localIcon(String icon) {
    late BehaviorSubject<LocalIcon> controller;
    controller = BehaviorSubject<LocalIcon>(
      onListen: () => boardIconReference.child(icon).onValue.listen(
        (event) {
          var value = event.snapshot.value;
          if (value != null) {
            Map<String, dynamic> json = Map<String, dynamic>.from(value as Map);

            LocalIcon localIcon = LocalIcon.fromJson(json);
            controller.add(localIcon);
            if (localIcon.isFound) {
              controller.close();
            }
          } else {
            debugPrint("74--");
            if (controller.hasValue) controller.close();
          }
        },
      ),
    );
    return controller.stream;
  }

  Stream<LocalPlayer> localPlayer(String player) {
    late BehaviorSubject<LocalPlayer> subject;
    subject = BehaviorSubject<LocalPlayer>(
      onListen: () => boardPlayerReference.child(player).onValue.listen(
        (event) {
          final value = event.snapshot.value;
          if (value == null) {
            if (subject.hasValue) subject.close();
          } else {
            Map<String, dynamic> json = Map<String, dynamic>.from(value as Map);
            final LocalPlayer player = LocalPlayer.fromJson(json);
            subject.add(player);
          }
        },
      ),
    );
    return subject.stream;
  }

  Stream<String> get currentID {
    late BehaviorSubject<String> subject;

    subject = BehaviorSubject(
      onListen: () => boardReference.child('currentID').onValue.listen(
        (event) {
          String? e = event.snapshot.value as String?;
          if (e == null && subject.hasValue) {
            subject.close();
          } else {
            subject.add(e!);
          }
        },
      ),
    );
    return subject.stream;
  }

  Future get removeData => boardReference.remove();

  Future setIconCheck(String icon, bool check) =>
      boardIconReference.child(icon).child("isCheck").set(check);

  Future setCurrentID(String player) =>
      boardReference.child('currentID').set(player);

  Future setCurrentIcon(String icon) =>
      boardReference.child('currentIcon').set(icon);

  Future leaveGame(String uid) async =>
      boardPlayerReference.child(uid).child("isActive").set(false);

  Future<dynamic> get increment async {
    // Increment counter in transaction.

    DatabaseReference ref = boardPlayerReference.child(userId!).child("pts");
    final TransactionResult transactionResult = await ref.runTransaction(
      (value) {
        return Transaction.success(value == null ? 1 : (value as int) + 1);
      },
    );

    return transactionResult.committed;
  }

  Future updateIcon(id, LocalIcon e) =>
      boardIconReference.child(id).update(e.toJson());

  Future updateBoard(Map<String, LocalIcon> map,
      {bool addPts = false, String? nextPlayer}) async {
    Map<String, Object?> x = Map.from(map);
    x.updateAll((key, value) => (value as LocalIcon).toJson());
    debugPrint(boardIconReference.path);
    return Future.wait<dynamic>(
      [
        boardIconReference.update(x),
        if (addPts) increment,
      ],
    );
  }
}
