import 'package:flutter_riverpod/flutter_riverpod.dart';

enum RoomType { normal, closed, orderwise }

final StateNotifierProvider<RoomTypeNotifier, RoomType> typeProvider =
    StateNotifierProvider<RoomTypeNotifier, RoomType>(
  (_) => RoomTypeNotifier(),
);

class RoomTypeNotifier extends StateNotifier<RoomType> {
  RoomTypeNotifier() : super(RoomType.normal);

  @override
  set state(RoomType value) => super.state = value;
}
