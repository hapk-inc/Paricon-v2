enum AuthValidate { notLogged, loggedIn, userExist }

//enum ScreenSize { smallMobile, mobile, tab, iPad, pc, tv, tooSmall }

enum BoardLevel { easy, hard }

enum BoardType { normal, closed, orderwise }

enum PlayerCount { vs, trio }

enum GameMatch { dailyMatch, playFriend, tournament }

enum ValidateRoom { notExists, duplicateCode, houseFull, alreadyStarted }

Map<BoardLevel, String> levelMap = Map.fromIterables(
  BoardLevel.values,
  ["30 Blocks: Simple Mode", "56 Blocks: Tough Mode"],
);

Map<BoardType, String> typeMap = Map.fromIterables(
  BoardType.values,
  [
    "Classic Pairing Fun",
    "Stealth Mode: Memory Challenge",
    "Memory Sequence Challenge: Match and Recall"
  ],
);

Map<PlayerCount, String> countMap = Map.fromIterables(
  PlayerCount.values,
  ["Duel Mode: One-on-One Battle", "Triple Threat: Three-Way Face-Off"],
);
