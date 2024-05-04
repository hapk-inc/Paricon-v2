import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

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
  UserRecord? _myBest;
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
          notifyListeners();
        }
      },
    );
  }

  UserRecord? get myBest {
    final String? id = ref.read(authUserProvider).value?.uid;
    if (!_list.any((e) => e.id == id)) return null;
    int index = _list.indexWhere((x) => x.id == id);
    return _list[index];
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

    notifyListeners();
  }

  List<UserRecord> get list => _list;

  int rank(String id) {
    List<UserRecord> sorted = List.from(_list);
    sorted.sort((a, b) => a.recordTimeTaken.compareTo(b.recordTimeTaken));
    return sorted.indexWhere((x) => x.id == id) + 1;
  }

  Future get checkPending async {
    _list.sort((a, b) => b.lastPlayed.compareTo(a.lastPlayed));

    DateTime lastCheck = _list.first.lastPlayed;
    final List<UserRecord> pending =
        await ref.watch(pendingRecordProvider(lastCheck).future);
    _logger.i("Pending Data $pending");
    if (!kIsWeb) {
      for (var i in pending) {
        _db.insertR(i.iJson);
      }
    }
    _list.addAll(pending);
  }

  onDispose() {
    _logger.d("Running OnDispose LeaderBoardNotifier");
    if (!kIsWeb) _db.delete();
  }
}
