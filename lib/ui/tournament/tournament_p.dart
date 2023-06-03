import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../logic/tournament_datastore.dart';
import '../../logic/tournament_notifier.dart';
import '../../logic/user_datastore.dart';
import '../../my_widgets/tournament_grid.dart';
import '../../ui/tournament/tournament_p1.dart';
import 'package:random_avatar/random_avatar.dart';

class TournamentP extends ConsumerStatefulWidget {
  const TournamentP({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _TournamentPState();
}

class _TournamentPState extends ConsumerState<TournamentP>
    with SingleTickerProviderStateMixin {
  late DateTime _initialTime;
  Duration _elapsed = Duration.zero;
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();

    _initialTime = DateTime.now();
    _ticker = createTicker((elapsed) {
      final now = DateTime.now();
      setState(() {
        _elapsed = now.difference(_initialTime);
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    ref.invalidate(tournamentNotifierProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(
      tournamentNotifierProvider.select((value) => value.allFound),
      (previous, flag) {
        if (flag && previous != flag) {
          print("Updating Tournament Score");
          ref.read(updateTournamentScoreProvider(_elapsed));
          //ref.invalidate(tournamentNotifierProvider);
          context.router.pop();
        }
      },
    );

    return SafeArea(
      child: Column(
        children: [
          _TournamentHeader(myTick: _elapsed),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TournamentGrid(),
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}

/*class TournamentP extends ConsumerWidget {
  const TournamentP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          const _TournamentHeader(),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TournamentGrid(),
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}*/

class _TournamentHeader extends ConsumerWidget {
  final Duration myTick;
  const _TournamentHeader({required this.myTick});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserProvider).value;
    final String xDuration =
        ((myTick.inMinutes * 60) + (myTick.inSeconds)).toString();

    return Container(
      height: 100.h,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xff9c0d38),
        borderRadius: BorderRadius.circular(8),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: myUser == null
            ? Container()
            : Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    height: 100.h,
                    width: 350.w,
                    child: LayoutBuilder(
                      builder: (_, p1) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 500),
                                  height: p1.maxHeight,
                                  left: -p1.maxWidth * 0.05,
                                  bottom: -p1.maxHeight * 0.075,
                                  width: p1.maxWidth * 0.4,
                                  child: CircleAvatar(
                                    radius: p1.maxHeight,
                                    backgroundColor: Colors.transparent,
                                    child: RandomAvatar(
                                      myUser.avatar,
                                      trBackground: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: ListTile(
                                contentPadding: EdgeInsets.only(top: 20.h),
                                minVerticalPadding: 0,
                                title: Container(
                                  height: 20.h,
                                  //color: Colors.red,
                                  alignment: Alignment.centerLeft,
                                  child: const FittedBox(
                                    child: AutoSizeText(
                                      "The timer has commenced",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white60, fontSize: 72,
                                        //decorationThickness: 40,
                                      ),
                                    ),
                                  ),
                                ),
                                subtitle: Container(
                                  height: 60.h,
                                  //color: Colors.amber,
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        xDuration,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'BrunoAceSC',
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                trailing: const TrophyRank(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
