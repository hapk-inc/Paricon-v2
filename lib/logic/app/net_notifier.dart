import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StreamProvider<List<ConnectivityResult>> internetConnectionProvider =
    StreamProvider<List<ConnectivityResult>>(
  (_) {
    final Connectivity connectivity = Connectivity();
    return connectivity.onConnectivityChanged;
  },
);

class NetConnectedNotifier extends StateNotifier<int> {
  NetConnectedNotifier() : super(-1);

  @override
  set state(int value) => super.state = value;
}

final StateNotifierProvider<NetConnectedNotifier, int>
    netConnectedNotifierProvider =
    StateNotifierProvider<NetConnectedNotifier, int>(
  (_) => NetConnectedNotifier(),
);
