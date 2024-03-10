import 'package:flutter_riverpod/flutter_riverpod.dart';

enum RoomLevel { beginner, expert }

final StateNotifierProvider<RoomLevelNotifier, RoomLevel> levelProvider =
    StateNotifierProvider<RoomLevelNotifier, RoomLevel>(
  (_) => RoomLevelNotifier(),
);

class RoomLevelNotifier extends StateNotifier<RoomLevel> {
  RoomLevelNotifier() : super(RoomLevel.beginner);

  @override
  set state(RoomLevel value) => super.state = value;
}
