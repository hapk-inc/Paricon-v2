import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:mock_data/mock_data.dart';

import '../../model/player.dart';
import '../user/bloc.dart';

const String _welcomePrompt =
    "Welcome the player in not more than 75 letters in one line "
    "when they opened the multiplayer puzzle app. "
    "It's a puzzle app where pairing two blocks of same icons. "
    //"Also, welcome the user with a holi celebration"
    "Also remove double-quotes and **. Use Easy English.";

const String _tournamentPrompt =
    " Rephrase this line - Ready, Set, Game : Join the Tournament. "
    "Use Easy English";

const String _subTournamentPrompt =
    "Give a subtitle for - Ready, Set, Game : Join the Tournament. "
    "Use Easy English";

const String _subPlayFriendPrompt =
    "Give a subtitle for - Play with Friends Online."
    "Use Easy English";
//" Player name is ";

//const String _changeName =
//    "If the player name starts with User#, then ask them to change name";

final Provider<GenerativeModel> geminiModelProvider =
    Provider<GenerativeModel>((_) => throw UnimplementedError());

final AutoDisposeFutureProvider<String?> welcomeUserProvider =
    FutureProvider.autoDispose<String?>(
  (ref) async {
    final GenerativeModel gemini = ref.watch(geminiModelProvider);
    final Player? me = ref.watch(userNotifierProvider).me;
    if (me == null) return null;
    final content = [Content.text(_welcomePrompt)];

    final response = await gemini.generateContent(content);
    return response.text;
  },
);

final AutoDisposeFutureProvider<String?> tournamentTextProvider =
    FutureProvider.autoDispose<String?>(
  (ref) async {
    final GenerativeModel gemini = ref.watch(geminiModelProvider);
    //final Player? me = ref.watch(userNotifierProvider).me;
    //if (me == null) return null;
    final content = [Content.text(_tournamentPrompt)];

    final response = await gemini.generateContent(content);
    return response.text;
  },
);

final AutoDisposeFutureProvider<String?> subTournamentTextProvider =
    FutureProvider.autoDispose<String?>(
  (ref) async {
    final GenerativeModel gemini = ref.watch(geminiModelProvider);
    //final Player? me = ref.watch(userNotifierProvider).me;
    //if (me == null) return null;
    final content = [Content.text(_subTournamentPrompt)];

    final response = await gemini.generateContent(content);
    return response.text;
  },
);

final AutoDisposeFutureProvider<String?> subPlayFriendTextProvider =
    FutureProvider.autoDispose<String?>(
  (ref) async {
    final GenerativeModel gemini = ref.watch(geminiModelProvider);
    //final Player? me = ref.watch(userNotifierProvider).me;
    //if (me == null) return null;
    final content = [Content.text(_subPlayFriendPrompt)];

    final response = await gemini.generateContent(content);
    return response.text;
  },
);

final Provider<String> dailyMatchTextProvider = Provider<String>(
  (_) => [
    "Tap on 2 blocks, remember their icons, and match them.",
    "Choose 2 blocks, memorize their icons, and pair them.",
    "Select 2 blocks, recall their icons, and find their pairs.",
    "Pick 2 blocks, remember their icons, and pair them together.",
    "Tap 2 blocks, memorize their icons, and then match them.",
    "Select 2 blocks, recall their icons, and pair them up.",
    "Click on 2 blocks, remember the icons, and find their matches.",
    "Choose 2 blocks, note their icons, and pair them."
  ][mockInteger(0, 7)],
);

final Provider<String> repeatTextProvider = Provider<String>(
  (_) => [
    "Continue this process to complete all blocks.",
    "Keep repeating this sequence until all blocks are matched.",
    "Repeat these steps to finish all blocks."
  ][mockInteger(0, 2)],
);
