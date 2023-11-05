import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';

final welcomeTitleProvider = Provider.family(
    (_, s) => ["Greetings, $s.", "Hey, $s!", "Hello, $s!"][mockInteger(0, 2)]);

final welcomeSubtitleProvider = Provider(
  (_) => [
    "You've earned a cool new avatar. "
        "To use it as your profile picture, just ",
    "To set it as your profile picture, simply ",
    "Make it your profile picture with a single ",
    "Just one click away from using it as your profile picture — "
  ][mockInteger(0, 3)],
);
