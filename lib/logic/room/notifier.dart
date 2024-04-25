import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';

import '../../enums/enums.dart';
import '../../model/room.dart';
import 'bloc.dart';
import 'database.dart';

/*
class RoomNotifier extends ChangeNotifier {
  Room _room = const Room();
  late RoomDatabase _roomDatabase;
  String? _id;

  final Ref ref;

  RoomNotifier(this.ref) {
    _roomDatabase = RoomDatabase(ref, _id);
  }

  @override
  void addListener(VoidCallback listener) {
    if (_id != null) {
      ref.listen<Room?>(
        roomProvider.select((value) => value.value),
        (previous, next) {
          debugPrint("27--");
          _room = next!;
          notifyListeners();
        },
      );
    }
  }

  set type(BoardType value) {
    if (_room.type == value) return;
    _room = _room.copyWith(type: value);
    notifyListeners();
  }

  set level(BoardLevel value) {
    if (_room.level == value) return;
    _room = _room.copyWith(level: value);
    notifyListeners();
  }

  set count(PlayerCount value) {
    if (_room.count == value) return;
    _room = _room.copyWith(count: value);
    notifyListeners();
  }

  String? get id => _id;

  Room get room => _room;

  Future<bool> get createRoom async {
    _room = room.copyWith(
      code: mockInteger(100000, 999999),
    );
    _id = await _roomDatabase.createRoom(_room);
    notifyListeners();
    return true;
  }
}
*/
