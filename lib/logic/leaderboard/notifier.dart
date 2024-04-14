import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/user_record.dart';
import '../auth/bloc.dart';
import 'bloc.dart';
import 'leaderboard_ql.dart';

final ChangeNotifierProvider<LeaderBoardNotifier> leaderBoardNotifierProvider =
    ChangeNotifierProvider<LeaderBoardNotifier>(
  (ref) => LeaderBoardNotifier(ref)..initialize,
);

class LeaderBoardNotifier extends ChangeNotifier {
  final Ref ref;
  List<UserRecord> _list = [];
  final LeaderBoardQL _db = LeaderBoardQL();

  LeaderBoardNotifier(this.ref);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    //
    ref.listen(
      onNewRecordProvider.select((value) => value.value),
      (previous, next) {
        //
        if (next != null) {
          final UserRecord i = next;
          _db.insertR(i.iJson);

          //
          int index = _list.indexWhere((x) => next.id == x.id);
          if (index.isNegative) {
            _list.insert(0, next);
          } else {
            _list[index] = next;
          }
          notifyListeners();
        }
      },
    );
  }

  Future get initialize async {
    _list = await _db.leaderboard;
    if (list.isEmpty) {
      final List<UserRecord> list = await ref.watch(overallProvider.future);
      for (var i in list) {
        _db.insertR(i.iJson);
      }
    } else {
      await checkPending;
    }
    notifyListeners();
  }

  List<UserRecord> get list => _list;

  int rank(String id) {
    List<UserRecord> sorted = List.from(_list);
    sorted.sort((a, b) => a.recordTimeTaken.compareTo(b.recordTimeTaken));
    return sorted.indexWhere((x) => x.id == id) + 1;
  }

  UserRecord? get me {
    final user = ref.watch(authUserProvider).value;
    bool x = _list.any((x) => x.id == (user?.uid ?? ""));
    if (x) {
      return _list.firstWhere((x) => x.id == (user?.uid ?? ""));
    }
    return null;
  }

/*  set list(List<UserRecord> value) {
    if (_list == value) return;
    _list = value;
    notifyListeners();
  }*/

/*  int rank(UserRecord record) {
    List<UserRecord> sorted = List.from(_list);
    sorted.sort((a, b) => a.recordTimeTaken.compareTo(b.recordTimeTaken));
    return sorted.indexOf(record) + 1;
  }*/

  Future get checkPending async {
    list.sort((a, b) => b.lastPlayed.compareTo(a.lastPlayed));

    DateTime lastCheck = list.first.lastPlayed;
    final List<UserRecord> pending =
        await ref.watch(pendingRecordProvider(lastCheck).future);

    for (var i in pending) {
      _db.insertR(i.iJson);
    }
  }
}
