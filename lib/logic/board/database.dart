import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';
import 'package:rxdart/rxdart.dart';

import '../../enums/enums.dart';
import '../../firebase/bloc.dart';
import '../../model/board.dart';
import '../../model/local_icon.dart';
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
          (room.level ?? BoardLevel.hard) == BoardLevel.hard ? 56 : 30),
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
            // subject.add(board);
          }
          return const Board();
        },
      );
  /* Stream<Board> get board {
    late BehaviorSubject<Board> subject;
    subject = BehaviorSubject(
      onListen: () => boardReference.onValue.listen(
        (event) {
          if (event.snapshot.value != null) {
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
          var value = event.snapshot.value;
          Map<String, dynamic> json = Map<String, dynamic>.from(value as Map);
          LocalIcon localIcon = LocalIcon.fromJson(json);

          controller.add(MapEntry(event.snapshot.key as String, localIcon));
        },
      ),
    );
    return controller.stream;
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
