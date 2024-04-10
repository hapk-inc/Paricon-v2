import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/user_record.dart';
import 'bloc.dart';
import 'leaderboard_ql.dart';

final leaderBoardNotifierProvider = ChangeNotifierProvider<LeaderBoardNotifier>(
  (ref) => LeaderBoardNotifier(ref)..init,
);

class LeaderBoardNotifier extends ChangeNotifier {
  final Ref ref;
  List<UserRecord> _list = [];
  final LeaderBoardQL _db = LeaderBoardQL();

  LeaderBoardNotifier(this.ref);

  Future get init async {
    list = await _db.leaderBoard;
    if (list.isEmpty) {
      final Map<String, UserRecord> m =
          await ref.watch(overallLeaderBoardProvider.future);
      m.forEach(
        (key, value) {
          _db.insertRecord({"id": key, ...value.toJson()});
        },
      );
    } else {
      debugPrint("30--NotEmpty ${list.toString()}");
    }
    notifyListeners();
  }

  List<UserRecord> get list => _list;

  set list(List<UserRecord> value) {
    if (_list == value) return;
    _list = value;
    notifyListeners();
  }
}
