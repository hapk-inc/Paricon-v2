import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../model/player.dart';
import '../../model/user_record.dart';
import '../auth/bloc.dart';
import 'bloc.dart';
import 'leaderboard_ql.dart';

final ChangeNotifierProvider<LeaderBoardNotifier> leaderBoardNotifierProvider =
    ChangeNotifierProvider<LeaderBoardNotifier>(
  (ref) => LeaderBoardNotifier(ref)..initialize,
);

Logger _logger = Logger();

class LeaderBoardNotifier extends ChangeNotifier {
  final Ref ref;
  List<UserRecord> _list = [];
  UserRecord? _myRecord;
  final LeaderBoardQL _db = LeaderBoardQL();

  LeaderBoardNotifier(this.ref);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    debugPrint("28--");

    //
    ref.listen<UserRecord?>(
      onNewRecordProvider.select((value) => value.value),
      (_, next) {
        _logger.i("onNewRecordProvider");
        //
        if (next != null) {
          final UserRecord i = next;
          if (!kIsWeb) _db.insertR(i.iJson);

          //
          int index = _list.indexWhere((x) => i.id == x.id);
          if (index.isNegative) {
            _list.insert(0, i);
          } else {
            _list[index] = i;
          }
          //_list.insert(index.isNegative ? 0 : index, next);
          notifyListeners();
        }
      },
    );
  }

  UserRecord? get myRecord => _myRecord;

  set myRecord(UserRecord? value) {
    if (_myRecord == value) return;
    _myRecord = value;
    notifyListeners();
  }

  Future get initialize async {
    if (!kIsWeb) _list = await _db.leaderboard;
    if (list.isEmpty) {
      _list = await ref.watch(overallLeaderboardProvider.future);
      if (!kIsWeb) {
        for (var i in list) {
          _db.insertR(i.iJson);
        }
      }
    } else {
      await checkPending;
    }

    //final String? uid = ref.read(authUserProvider).value?.uid;
    //if()
    notifyListeners();
  }

  List<UserRecord> get list => _list;

  int rank(String id) {
    List<UserRecord> sorted = List.from(_list);
    sorted.sort((a, b) => a.recordTimeTaken.compareTo(b.recordTimeTaken));
    return sorted.indexWhere((x) => x.id == id) + 1;
  }

/*  UserRecord? get me {
    final user = ref.read(authUserProvider).value;
    bool x = _list.any((x) => x.id == (user?.uid ?? ""));
    if (x) {
      return _list.firstWhere((x) => x.id == (user?.uid ?? ""));
    }
    return null;
  }*/

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
    _logger.i("Pending Data $pending");
    if (!kIsWeb) {
      for (var i in pending) {
        _db.insertR(i.iJson);
      }
    }
    list.addAll(pending);
  }

  onDispose() {
    _logger.d("Running OnDispose LeaderBoardNotifier");
    if (!kIsWeb) _db.delete();
  }

/*  @override
  void dispose() {
    _logger.i("Running OnDispose LeaderBoardNotifier");
    if (!kIsWeb) _db.delete();
    super.dispose();
  }*/
}
