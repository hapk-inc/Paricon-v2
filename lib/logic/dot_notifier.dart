import 'package:flutter_riverpod/flutter_riverpod.dart';

final dotNotifierProvider = StateNotifierProvider<DotNotifier, int>(
  (ref) {
    return DotNotifier();
  },
);

class DotNotifier extends StateNotifier<int> {
  DotNotifier() : super(0);
  void increment() => state++;
}
