import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../enums/enums.dart';

final StateNotifierProvider<MatchNotifier, GameMatch> matchNotifierProvider =
    StateNotifierProvider<MatchNotifier, GameMatch>(
  (_) => MatchNotifier(),
);

class MatchNotifier extends StateNotifier<GameMatch> {
  MatchNotifier() : super(GameMatch.dailyMatch);

  bool get isDailyMatch =>
      state == GameMatch.dailyMatch || state == GameMatch.tournament;

  @override
  set state(GameMatch value) => state == value;
}
