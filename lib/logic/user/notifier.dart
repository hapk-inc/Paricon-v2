import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../model/player.dart';
import '../auth/bloc.dart';
import 'bloc.dart';
import 'user_database.dart';

Logger _logger = Logger();

//const Duration _m900 = Duration(milliseconds: 900);

class UserNotifier extends ChangeNotifier {
  final UserDatabase _db = UserDatabase();
  Player? _me;
  final Ref ref;

  UserNotifier(this.ref);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    _logger.i("Overriding User Notifier Listener");

    ref.listen<Player?>(
      meProvider.select((value) => value.value),
      (_, next) {
        if (next != null) {
          _logger.i("AuthNotifier Listener $next");
          me = next;
        }
      },
    );
  }

  Future initializeMe() async {
    _logger.d("initializeMe");
    final String? id = ref.read(authUserProvider).value?.uid;
    if (id != null) {
      me = await _db.player(id);
      _logger.d("Initialize Player $_me");
      if (me == null) {
        newUser(id);
      } else {
        _logger.i(me);
      }
    }
  }

  Future newUser(id) async {
    _logger.d("New User");
    me = Player.createOne();
    await _db.insertUser(me!.toDatabase(id));
    ref.read(createMeProvider(me));
  }

  Player? get me => _me;

  set me(Player? value) {
    if (_me == value) return;
    _me = value;
    notifyListeners();
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    super.dispose();
    _logger.d("Running OnDispose");
    _db.delete();
  }
}
