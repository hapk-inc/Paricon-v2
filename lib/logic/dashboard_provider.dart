import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';

final ProviderFamily<String, String> welcomeTitleProvider =
    Provider.family((_, s) => ["Greetings", "Hey", "Hello"][mockInteger(0, 2)]);

final welcomeSubtitleProvider = Provider(
  (_) => [
    "You've earned a cool new avatar. "
        "To use it as your profile picture, just ",
    "To set it as your profile picture, simply ",
    "Make it your profile picture with a single ",
    "Just one click away from using it as your profile picture — "
  ][mockInteger(0, 3)],
);

final Provider<String> goodDayProvider = Provider<String>(
  (_) => [
    "Hope your day is going wonderfully",
    "Trust your day is going splendidly",
    "Hoping your day is fantastic",
    "May your day be filled with happiness and success",
    "Wishing you a day full of happiness and achievements"
  ][mockInteger(0, 4)],
);

final StateNotifierProvider<DPanelOption, Widget> dPanelWidgetProvider =
    StateNotifierProvider<DPanelOption, Widget>(
  (_) => DPanelOption(),
);

class DPanelOption extends StateNotifier<Widget> {
  DPanelOption() : super(Container());
}

enum PGroupOption { everyone, friends }

final StateNotifierProvider<PGroupOptionState, PGroupOption>
    pGroupOptionProvider =
    StateNotifierProvider<PGroupOptionState, PGroupOption>(
  (_) => PGroupOptionState(),
);

class PGroupOptionState extends StateNotifier<PGroupOption> {
  PGroupOptionState() : super(PGroupOption.everyone);
}
