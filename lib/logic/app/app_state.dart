import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStateNotifier extends StateNotifier<AppLifecycleState> {
  final Ref ref;
  AppStateNotifier(this.ref) : super(AppLifecycleState.resumed);

  @override
  set state(AppLifecycleState value) {
    super.state = value;
  }
}

final StateNotifierProvider<AppStateNotifier, AppLifecycleState>
    appStateNotifierProvider =
    StateNotifierProvider<AppStateNotifier, AppLifecycleState>(
  (ref) => AppStateNotifier(ref),
);
