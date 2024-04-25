import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoomIdNotifier extends StateNotifier<String?> {
  RoomIdNotifier() : super(null);

  @override
  set state(String? value) => super.state = value;

  empty() => state = null;
}
