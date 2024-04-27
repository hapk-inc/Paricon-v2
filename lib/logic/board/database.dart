import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../../enums/enums.dart';
import '../../firebase/bloc.dart';
import '../../model/board.dart';
import '../../model/local_icon.dart';
import '../../model/local_player.dart';
import '../../model/room.dart';
import 'create_board.dart';

class BoardDatabase {
  final Ref ref;
  final String? id;

  late DatabaseReference firebaseReference;
  late DatabaseReference boardReference;

  BoardDatabase(this.ref, [this.id]) {
    firebaseReference = ref.read(databaseProvider).ref();
    boardReference = firebaseReference.child('board').child(id!);
  }

  Future createBoard(Room room) async {
    final Board board = Board(
      icons: CreateBoard.icons(
          (room.level ?? BoardLevel.hard) == BoardLevel.hard ? 56 : 6),
      players: CreateBoard.localPlayers(room.players ?? {}),
      currentID: room.players?.keys.elementAt(0),
      type: room.type ?? BoardType.normal,
    );

    return boardReference.set(board.toJson());
  }

  Future<Board> get initBoard => boardReference.once().then(
        (DatabaseEvent event) {
          if (event.snapshot.value != null) {
            Board board = Board.fromSnapshot(event.snapshot);
            return board;
          }
          debugPrint("43--No Data");
          return const Board();
        },
      );

/*  Stream<Board> get onBoardChange {
    late BehaviorSubject<Board> subject;
    subject = BehaviorSubject(
      onListen: () => boardReference.onChildChanged.listen(
        (event) {
          if (event.snapshot.value != null) {
            debugPrint("54----]]]");
            debugPrint("${event.snapshot.value}");
            Board board = Board.fromSnapshot(event.snapshot);
            subject.add(board);
          }
        },
      ),
    );
    return subject.stream;
  }*/

  Future updateIcon(String i, LocalIcon icon) =>
      boardReference.child('icons').child(i).update(icon.toJson());

  Future updateBoard(Board board) => boardReference.update(board.toJson());

  Stream<MapEntry<String, LocalIcon>> get onIconChanged {
    late BehaviorSubject<MapEntry<String, LocalIcon>> controller;
    controller = BehaviorSubject(
      onListen: () => boardReference.child('icons').onChildChanged.listen(
        (event) {
          Map value = event.snapshot.value as Map;
          Map<String, dynamic> json = Map<String, dynamic>.from(value);
          LocalIcon localIcon = LocalIcon.fromJson(json);

          controller.add(MapEntry(event.snapshot.key as String, localIcon));
        },
      ),
    );
    return controller.stream;
  }

  Stream<MapEntry<String, LocalPlayer>> get onPlayerChanged {
    late BehaviorSubject<MapEntry<String, LocalPlayer>> controller;
    controller = BehaviorSubject(
      onListen: () => boardReference.child('players').onChildChanged.listen(
        (event) {
          Map value = event.snapshot.value as Map;
          //
          Map<String, dynamic> json = Map<String, dynamic>.from(value);
          LocalPlayer p = LocalPlayer.fromJson(json);

          controller.add(MapEntry(event.snapshot.key as String, p));
        },
      ),
    );
    return controller.stream;
  }

  Stream<String> get currentID {
    late BehaviorSubject<String> subject;
    subject = BehaviorSubject(
      onListen: () => boardReference.child('currentID').onValue.listen(
        (event) {
          String? e = event.snapshot.value as String?;
          debugPrint("110---]] $e");
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

  /* Stream<LocalIcon> localIcon(String icon) {
    late BehaviorSubject<LocalIcon> controller;
    controller = BehaviorSubject<LocalIcon>(
      onListen: () => boardReference.child('icons').child(icon).onValue.listen(
        (event) {
          debugPrint("72--OnChildChanged");
          var value = event.snapshot.value;
          if (value != null) {
            Map<String, dynamic> json = Map<String, dynamic>.from(value as Map);
            LocalIcon localIcon = LocalIcon.fromJson(json);
            if (!controller.hasValue) {
              controller.add(localIcon);
            } else if (controller.value.checkFound != localIcon.checkFound) {
              controller.add(localIcon);
            } else {
              debugPrint("81--Same Icon");
            }
            if (localIcon.isFound ?? false) controller.close();
          } else {
            if (controller.hasValue) controller.close();
          }
        },
      ),
    );
    return controller.stream;
  }*/
}
