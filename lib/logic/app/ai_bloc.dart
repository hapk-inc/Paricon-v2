import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../model/player.dart';
import '../user/bloc.dart';

const String _welcomePrompt =
    "Welcome the player in not more than 75 letters in one line when they opened the multiplayer puzzle app. "
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
