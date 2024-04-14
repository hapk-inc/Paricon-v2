import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<SizeNotifier, double> sizeProvider =
    StateNotifierProvider<SizeNotifier, double>(
  (_) => SizeNotifier(0.0),
);

class SizeNotifier extends StateNotifier<double> {
  SizeNotifier(super.state);

  @override
  set state(double value) => super.state = value;
}
