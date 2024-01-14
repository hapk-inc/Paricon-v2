import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/board.dart';
import '../model/local_icon.dart';
import 'board_provider.dart';

final AutoDisposeChangeNotifierProvider<PlayFriendListener>
    playFriendNotifierProvider =
    AutoDisposeChangeNotifierProvider((ref) => PlayFriendListener(ref));

class PlayFriendListener extends ChangeNotifier {
  final Ref ref;
  late Board? board;
  late Map<String, LocalIcon> _icon;

  PlayFriendListener(this.ref) {
    board = ref.read(boardProvider).when(
          data: (d) {
            if (d != null) {}
            return d;
          },
          error: (_, __) => null,
          loading: () => null,
        );
  }
}
