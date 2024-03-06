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

final Provider<String> shareCodeProvider = Provider<String>(
  (_) => [
    "Share your code with friends and unlock a special bonus avatar for your collection.",
    "Invite friends to exchange code and unlock an exclusive bonus avatar for your collection.",
    "Team up with friends, share your code, and enjoy a cool new bonus avatar for your collection.",
  ][mockInteger(0, 2)],
);

final Provider<String> pasteCodeTextProvider = Provider<String>(
  (_) => [
    "Once you've copied the avatar code, please click the paste icon to enable us to share a new avatar.",
    "If you've copied the avatar code, simply click on the paste icon to initiate sharing of a new avatar.",
    "Click on the paste icon after copying the avatar code so we can proceed with sharing a new avatar.",
    "Once you've copied the avatar code, use the paste icon to enable us to share a new avatar.",
  ][mockInteger(0, 3)],
);

final Provider<String> pasteCodeTitleTextProvider = Provider<String>(
  (_) => [
    "Input your friend's code below",
    "Insert your friend's code here",
    // "Paste the avatar's code from your friend",
  ][mockInteger(0, 1)],
);

/*enum PGroupOption { everyone, friends }

final StateNotifierProvider<PGroupOptionState, PGroupOption>
    pGroupOptionProvider =
    StateNotifierProvider<PGroupOptionState, PGroupOption>(
  (_) => PGroupOptionState(),
);

class PGroupOptionState extends StateNotifier<PGroupOption> {
  PGroupOptionState() : super(PGroupOption.everyone);
}*/
