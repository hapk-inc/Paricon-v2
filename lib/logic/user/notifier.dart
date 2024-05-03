import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../model/player.dart';
import '../auth/bloc.dart';
import 'bloc.dart';
import 'user_ql.dart';

Logger _logger = Logger();

final ChangeNotifierProvider<UserNotifier> userNotifierProvider =
    ChangeNotifierProvider<UserNotifier>(
  (ref) => UserNotifier(ref)..initialize(),
);

class UserNotifier extends ChangeNotifier {
  final UserQL _db = UserQL();
  List<Player> _list = [];
  Player? _me;
  final Ref ref;

  UserNotifier(this.ref);

  Future initialize() async {
    debugPrint("26---Initialize");
    _list = await _db.userList;
    if (_list.isEmpty) {
      _list = await ref.watch(overallUserProvider.future);
      debugPrint("29--Running overallUserProvider $_list");
      for (var player in _list) {
        _db.insertUser(player.toDatabase());
      }
    } else {
      await checkPending;
    }
    /*final String? id = ref.read(authUserProvider).value?.uid;
    if (id != null) {
      me = kIsWeb ? null : await _sql.player(id);
      if (_me == null) createMe(id);
    }*/
    notifyListeners();
  }

  Future get checkPending async {
    debugPrint("46---checkPending");
    for (var i in _list) {
      debugPrint("48--${i.nowTime}");
    }
    _list.sort((a, b) =>
        (b.nowTime ?? DateTime.now()).compareTo((a.nowTime ?? DateTime.now())));

    DateTime lastCheck = _list.first.nowTime ?? DateTime.now();
    final List<Player> pending =
        await ref.watch(pendingUserProvider(lastCheck).future);
    _logger.i("Pending User $pending");
    for (var i in pending) {
      _db.insertUser(i.toDatabase());
    }
    _list.addAll(pending);
  }

  Future createMe(id) async {
    me = Player.createOne();
    //if (!kIsWeb) await _db.insertUser(me!.toDatabase(id));
    if (!kIsWeb) await _db.insertUser(me!.toDatabase());
    ref.read(createMeProvider(me));
  }

  Player? get me => _me;

  set me(Player? value) {
    if (_me == value) return;
    _me = value;
    notifyListeners();
  }

/*  Future insertUser(String id, Player player) async {
    if (!kIsWeb) await _db.insertUser(me!.toDatabase(id));
    if (!kIsWeb) await _db.insertUser(me!.toDatabase(id));
  }*/

  onDispose() {
    _logger.d("Running OnDispose UserNotifier");
    if (!kIsWeb) _db.delete();
  }
}
