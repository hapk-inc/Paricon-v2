import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paricon/logic/room_id.dart';
import 'package:rxdart/rxdart.dart';

import '../model/board.dart';
import '../model/local_icon.dart';
import 'auth_provider.dart';
import 'firebase_init.dart';

final Provider<BoardDatabase> boardDatabaseProvider = Provider(
  (ref) {
    final String id = ref.watch(idNotifier);
    return BoardDatabase(ref, id: id);
  },
);

class BoardDatabase {
  final Ref ref;
  final String? id;

  late DatabaseReference firebaseReference;

  late String? userId;
  late DatabaseReference boardReference;
  late DatabaseReference boardIconReference;

  BoardDatabase(this.ref, {this.id}) {
    firebaseReference = ref.read(databaseProvider).ref();

    userId = ref.watch(authUserProvider).value!.uid;

    boardReference = id == null
        ? firebaseReference.child('boards')
        : firebaseReference.child('boards/${id!}');

    boardIconReference = id == null
        ? firebaseReference.child('boards')
        : firebaseReference.child('boards/${id!}/icons');
  }

  Future createBoard(Map board) async => await boardReference.set(board);

  Future<Board?> get board async => await boardReference.once().then(
        (DatabaseEvent event) {
          if (!event.snapshot.exists) {
            return null;
          }
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
            if (controller.hasValue) controller.close();
          }
        },
      ),
    );
    return controller.stream;
  }
}
