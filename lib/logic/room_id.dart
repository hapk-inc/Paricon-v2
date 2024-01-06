import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<IdNotifier, String> idNotifier =
    StateNotifierProvider<IdNotifier, String>(
  (ref) {
    return IdNotifier();
  },
);

class IdNotifier extends StateNotifier<String> {
  IdNotifier() : super("");

  @override
  set state(String value) => super.state = value;

  empty() => state = "";
}
