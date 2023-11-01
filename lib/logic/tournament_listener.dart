import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paricon/logic/user_provider.dart';
import 'package:paricon/model/p_user.dart';

import '../model/local_icon.dart';
import '../model/my_user.dart';
import '../model/t_score.dart';
import '../my_widget/g_icons.dart';
import '../theme/my_color.dart';
import 'auth.dart';
import 'firebase_init.dart';

final tournamentListenerNotifierProvider =
    ChangeNotifierProvider((_) => TournamentListener());

class TournamentListener extends ChangeNotifier {
  late List<LocalIcon> _icons;
  late bool _alreadyClicked;
  late bool _inWait;
  late bool _allFound;
  //late Timer? _timer;
  late Stopwatch _stopwatch;
  double _balancePercentage = 0.0;
  //Duration _duration = Duration.zero;

  //late Duration _tDuration;

  TournamentListener() {
    debugPrint("Running TournamentListener");
    _icons = _newIcons;
    _alreadyClicked = true;
    _stopwatch = Stopwatch();
    _inWait = false;
    _allFound = false;
  }

  bool get allFound => _allFound;

  bool get inWait => _inWait;

  double get balancePercentage => _balancePercentage;

  bool get alreadyClicked => _alreadyClicked;

  Stopwatch get stopwatch => _stopwatch;

  List<LocalIcon> get icons => _icons;

  void iconClick(LocalIcon i) async {
    _icons[i.iconNo] = i.copyWith(isCheck: true);
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      notifyListeners();
    }
    _alreadyClicked = !_alreadyClicked;
    if (_alreadyClicked) {
      _inWait = true;
      notifyListeners();
      await Future.delayed(
        const Duration(milliseconds: 700),
        () {
          Iterable<LocalIcon> x = _icons.where((element) => element.isCheck);
          if (x.every((e) => x.first.iconCode == e.iconCode)) {
            for (var e in x) {
              _icons[e.iconNo] = e.copyWith(
                  isCheck: false, isFound: true, color: majorelleBlue.value);
            }
            int iconFoundCount =
                _icons.where((element) => element.isFound).length;
            _balancePercentage = iconFoundCount / _icons.length;
            _allFound = _icons.every((element) => element.isFound);
            if (_allFound) {
              _stopwatch.stop();
            }
          } else {
            for (var e in x) {
              icons[e.iconNo] = e.copyWith(isCheck: false);
            }
          }
        },
      );
    }
    _inWait = false;
    notifyListeners();
  }
}

List<LocalIcon> get _newIcons {
  List<IconData> x = List.from(gIcons);
  x.shuffle();
  List<IconData> y = List.from(x.take(kDebugMode ? 6 : 36));
  List<IconData> z = y + y;
  z.shuffle();
  return List.generate(
    kDebugMode ? 12 : 72,
    (index) => LocalIcon(iconCode: z[index].codePoint, iconNo: index),
  );
}

final tournamentDatabaseProvider = Provider((ref) => TournamentDatabase(ref));

class TournamentDatabase {
  final Ref ref;

  late DatabaseReference firebaseReference;
  late FirebaseFirestore firebaseFirestore;
  late String? userId;

  TournamentDatabase(this.ref) {
    firebaseFirestore = ref.read(fireStoreProvider);
    firebaseReference = ref.read(databaseProvider).ref();
    userId = ref.read(firebaseUserProvider).uid;
  }

  Future<void> updateTDuration(TScore tScore) async {
    PUser pUser = await ref.read(pUserMeProvider.future);
    final MyUser myUser = pUser.myUser;
    firebaseReference.child('tournament').push().set(tScore.toJson());
    return firebaseFirestore.collection('users').doc(userId).update(
      {
        'lastGamePlayed': tScore.playedAt.toIso8601String(),
        'bestDuration': myUser.bestDuration == null
            ? tScore.tDuration.inMicroseconds
            : myUser.bestDuration!.compareTo(tScore.tDuration) < 0
                ? tScore.tDuration.inMicroseconds
                : myUser.bestDuration?.inMicroseconds
      },
    );
  }
}
