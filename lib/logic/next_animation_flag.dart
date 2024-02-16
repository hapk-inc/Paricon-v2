import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChangeNotifierProvider<RepeatAnimationNotifier>
    repeatAnimationNotifierProvider =
    ChangeNotifierProvider<RepeatAnimationNotifier>(
  (ref) => RepeatAnimationNotifier(ref),
);

class RepeatAnimationNotifier extends ChangeNotifier {
  bool _repeatAnimation = false;

  Duration _animDuration = const Duration(seconds: 3);

  int _index = 0;

  Ref ref;

  RepeatAnimationNotifier(this.ref);

  //@override
  //void addListener(VoidCallback listener) {}

  bool get repeatAnimation => _repeatAnimation;

  set repeatAnimation(bool value) {
    if (_repeatAnimation == value) return;
    _repeatAnimation = value;
    notifyListeners();
  }

  Duration get animDuration => _animDuration;

  set animDuration(Duration value) {
    if (_animDuration == value) return;
    _animDuration = value;
    notifyListeners();
  }

  int get index => _index;

  set index(int value) {
    if (_index == value) return;
    _index = value;
    notifyListeners();
  }
}
