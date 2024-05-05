import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../model/player.dart';

import '../auth/bloc.dart';
import 'bloc.dart';
import 'user_db.dart';

Logger _logger = Logger();

final ChangeNotifierProvider<UserNotifier> userNotifierProvider =
    ChangeNotifierProvider<UserNotifier>(
  (ref) => UserNotifier(ref)..initialize(),
);

class UserNotifier extends ChangeNotifier {
  final UserDB _db = UserDB();
  List<Player> _users = [];
  Player? _me;
  final Ref ref;

  UserNotifier(this.ref);

  @override
  void addListener(VoidCallback listener) {
    //
    ref.listen<Player?>(
      onNewPlayerProvider.select((value) => value.value),
      (_, next) async {
        _logger.i("onNewPlayerProvider $next");
        //
        if (next != null) {
          final Player p = next;

          if (_users.any((x) => x.id == p.id)) {
            int index = _users.indexWhere((x) => p.id == x.id);
            Player existing = _users[index];
            bool sameP = p == existing;
            debugPrint("40--$sameP");
            if (!sameP) {
              _users[index] = next;
              if (!kIsWeb) _db.insertUser(p.toDatabase());
            }
          } else {
            _users.insert(0, next);
            if (!kIsWeb) _db.insertUser(p.toDatabase());
          }

          notifyListeners();
        }
      },
    );
    super.addListener(listener);
  }

  Future initialize() async {
    if (!kIsWeb) _users = await _db.userList;
    if (_users.isEmpty) {
      _users = await ref.watch(overallUserProvider.future);
      if (!kIsWeb) {
        for (Player p in _users) {
          _db.insertUser(p.toDatabase());
        }
      }
    }
    debugPrint("70--$_users");
    await myUser();
    await pendingUser();
    updateNowTime();

    notifyListeners();
  }

  Player? get me => _me;

  List<Player> get users => _users;

  Future myUser() async {
    final String? id = ref.read(authUserProvider).value?.uid;
    debugPrint("84--${id}");
    if (_users.isEmpty) {
      debugPrint("86--");
      await createMe(id);
    } else {
      final int index = _users.indexWhere((x) => x.id == id);
      if (index.isNegative) {
        await createMe(id);
      } else {
        _me = _users[index];
      }
    }
  }

  Future createMe(String? id) async {
    _me = Player.createOne();
    ref.read(createMeProvider(me));
    _me = _me?.copyWith(id: id, avatarCode: ref.read(newAvatarCodeProvider));
  }

  Future pendingUser() async {
    final DateTime nw = DateTime.now();
    if (_users.isNotEmpty) {
      _users.sort((a, b) => (b.nowTime ?? nw).compareTo((a.nowTime ?? nw)));
      debugPrint("50--$_users");
      DateTime lastCheck = _users.first.nowTime ?? nw;
      //
      final List<Player> pending =
          await ref.watch(pendingUserProvider(lastCheck).future);

      //
      _logger.i("Pending User $pending");
      if (!kIsWeb) {
        for (Player player in pending) {
          _db.insertUser(player.toDatabase());
        }
      }
      //
      if (pending.isNotEmpty) {
        for (Player p in pending) {
          final int index = _users.indexWhere((x) => x.id == p.id);
          if (index.isNegative) {
            _users.insert(0, p);
          } else {
            _users[index] = p;
          }
        }
      }
      ;
    }
  }

  updateNowTime() {
    if (_me != null) {
      final nw = DateTime.now();
      Duration difference = nw.difference(_me?.nowTime ?? nw);
      if (difference.inMinutes >= 1) {
        debugPrint("80--");
        ref.read(updateNowTimeProvider);
      }
    }
  }

  onDispose() {
    _logger.d("Running OnDispose UserNotifier");
    if (!kIsWeb) _db.delete();
  }

  Player? player(String id) {
    if (!_users.any((e) => e.id == id)) return null;
    int index = _users.indexWhere((x) => id == x.id);
    return _users[index];
  }
}
