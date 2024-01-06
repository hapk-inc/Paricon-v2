import 'package:flutter_riverpod/flutter_riverpod.dart';

enum RoomLevel { easy, medium, hard }

final StateNotifierProvider<RoomLevelNotifier, RoomLevel> levelProvider =
    StateNotifierProvider<RoomLevelNotifier, RoomLevel>(
  (_) => RoomLevelNotifier(),
);

class RoomLevelNotifier extends StateNotifier<RoomLevel> {
  RoomLevelNotifier() : super(RoomLevel.easy);

  @override
  set state(RoomLevel value) => super.state = value;
}
