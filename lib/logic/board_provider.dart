import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/board.dart';
import '../model/local_icon.dart';
import '../model/local_player.dart';
import 'board_database.dart';

final AutoDisposeFutureProvider<Board?> boardProvider =
    FutureProvider.autoDispose<Board?>(
  (ref) async {
    final boardDatabase = ref.watch(boardDatabaseProvider);
    return boardDatabase.board;
  },
);

final AutoDisposeStreamProviderFamily<LocalIcon, String> iconProvider =
    StreamProvider.family.autoDispose<LocalIcon, String>(
  (ref, icon) {
    final boardDatabase = ref.read(boardDatabaseProvider);
    return boardDatabase.localIcon(icon);
  },
);

final AutoDisposeStreamProviderFamily<LocalPlayer, String>
    playFriendPlayerProvider =
    StreamProvider.family.autoDispose<LocalPlayer, String>(
  (ref, p) {
    final boardDatabase = ref.read(boardDatabaseProvider);
    return boardDatabase.localPlayer(p);
  },
);

final AutoDisposeStreamProvider<String> currentIDProvider =
    StreamProvider.autoDispose<String>(
  (ref) {
    final boardDatabase = ref.read(boardDatabaseProvider!);
    return boardDatabase.currentID;
  },
);

/*
final btnClickProvider = FutureProvider.family.autoDispose<bool, String>(
  (ref, _icon) async {
    final boardDatabase = ref.read(boardDatabaseProvider);
    final notifier = ref.read(onlineBoardNotifier);
    final firebaseUser = ref.read(firebaseUserProvider!);

    final board = ref.read(boardProvider).data!.value;
    final iconsID = board.icons;

    final String color = notifier.myPlayer!.color;

    await boardDatabase.setIconCheck(_icon, true);
    notifier.alreadyClicked = !notifier.alreadyClicked;

    if (!notifier.alreadyClicked) {
      final List<LocalIcon> selectedIcons = notifier.icons
          .where((element) => element.isCheck && !element.isFound)
          .toList(growable: false);

      if (selectedIcons.length == 2) {
        final bool sameIcons =
            selectedIcons.first.checkIconCode(selectedIcons.last);
        bool _validate = false;

        if (notifier.type == GameType.orderWise) {
          if (sameIcons) {
            final String orderWiseIcon =
                await ref.read(currentIconProvider.last);
            if (orderWiseIcon.isEmpty) {
              _validate = sameIcons;
            } else {
              _validate = selectedIcons.first.iconCode == orderWiseIcon;
            }
          } else {
            _validate = false;
          }
        } else {
          _validate = sameIcons;
        }

        if (_validate) {
          await boardDatabase.increment(firebaseUser.uid);

          await Future.wait(
            selectedIcons.map(
              (e) {
                final updatedIcon =
                    e.copyWith(color: color, isFound: true, isCheck: false);
                return boardDatabase.updateIcon(
                    iconsID[e.iconNo! - 1], updatedIcon);
              },
            ),
          );

          if (notifier.type == GameType.orderWise) {
            if (notifier.orderWiseIcon) {
              await boardDatabase.setCurrentIcon("");
              notifier.orderWiseIcon = false;
            }
          }
        } else {
          final List<int> iconOrder = selectedIcons.map(
            (e) {
              final int i = e.iconNo! - 1;
              return i;
            },
          ).toList(growable: false);
          await Future.delayed(
            DurationCount.m500,
            () => Future.wait(
              iconOrder.map(
                (e) => boardDatabase.setIconCheck(iconsID[e], false),
              ),
            ),
          );
          if (notifier.type == GameType.orderWise) {
            if (!notifier.orderWiseIcon) {
              final List<LocalIcon> falseIcons = notifier.icons
                  .where((element) => !element.isCheck && !element.isFound)
                  .toList(growable: false);
              final String newOrderWiseIcon =
                  falseIcons[Random.secure().nextInt(falseIcons.length)]
                      .iconCode;
              await boardDatabase.setCurrentIcon(newOrderWiseIcon);
              notifier.orderWiseIcon = true;
            }
          }
          await ref.read(nextPlayerProvider.future);
        }
      } else if (selectedIcons.length > 2) {
        FirebaseCrashlytics.instance.recordError(
          "Exceeded Selected Icons",
          null,
          reason: 'BtnCLick Provider issue',
          fatal: false,
        );
        */
/*FirebaseCrashlytics.instance
            .log("Selected icons are more than ${selectedIcons.length}");*/ /*

        final List<int> iconOrder = selectedIcons.map(
          (e) {
            final int i = e.iconNo! - 1;
            return i;
          },
        ).toList(growable: false);

        Future.wait(
          [
            ...iconOrder.map(
              (e) => boardDatabase.setIconCheck(iconsID[e], false),
            ),
            ref.read(nextPlayerProvider.future)
          ],
        );
      }
      return true;
    } else
      return false;
  },
);

final AutoDisposeFutureProvider nextPlayerProvider = FutureProvider.autoDispose(
  (ref) async {
    final boardDatabase = ref.read(boardDatabaseProvider);
    final boardNotifier = ref.read(onlineBoardNotifier);
    final firebaseUser = ref.read(firebaseUserProvider!);

    final board = ref.read(boardProvider).data!.value;
    final List<String> playersID = List.castFrom(board.players);
    final players = boardNotifier.players;
    if (players.length != 1) {
      int i = boardNotifier.currentIndex.toInt();
      do {
        i++;
        if (i == players.length) i = 0;
      } while (!players[i.toInt()].isActive);
      if (playersID[i] != firebaseUser.uid)
        await boardDatabase.setCurrentID(playersID[i]);
    }
  },
);
*/
