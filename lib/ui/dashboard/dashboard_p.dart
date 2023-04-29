import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../logic/auth.dart';
import '../../logic/tournament_datastore.dart';
import '../../logic/user_datastore.dart';
import '../../model/my_user.dart';
import '../../my_widgets/my_list_tile.dart';
import '../../my_widgets/today_leaderboard_list_view.dart';
import '../../routes/my_route.dart';

class DashboardP extends ConsumerWidget {
  const DashboardP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser myUser = ref.watch(myUserProvider).value!;

    ref.listen(
      tScoresOnChangeProvider.select((value) => value.value),
      (previous, next) {
        if (next != null) {
          ref.read(tScoreListProvider.notifier).addItem(next);
        }
      },
    );

    return LayoutBuilder(
      builder: (_, p1) => Column(
        children: [
          _MyProfileOpenContainer(myUser: myUser),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Flexible(
                    child: TabBar(
                      tabs: ["Tournament", "Friendly Match"]
                          .map((e) => Tab(text: e))
                          .toList(),
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: p1.maxHeight * 0.0225,
                        fontWeight: FontWeight.w700,
                      ),
                      onTap: (int page) {
                        if (page == 1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: AutoSizeText(
                                "Will be coming in the next release",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      unselectedLabelColor: Colors.deepPurple.shade100,
                      labelColor: Colors.deepPurple.shade400,
                      indicatorColor: Colors.deepPurple.shade400,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: SingleChildScrollView(
                      child: Column(
                        children: const [
                          Space20(),
                          _PlayTournamentButton(),
                          Space20(),
                          _DashboardSubHeader(title: "Today's Leaderboard"),
                          Space10(),
                          TodayLeaderBoardListView(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MyProfileOpenContainer extends StatelessWidget {
  const _MyProfileOpenContainer({required this.myUser});

  final MyUser myUser;

  @override
  Widget build(BuildContext context) => OpenContainer(
        closedShape:
            const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        closedBuilder: (context, action) => Container(
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent.shade200,
            borderRadius: BorderRadius.zero,
          ),
          height: 150.h,
          padding: EdgeInsets.only(right: 8.w),
          child: Stack(
            children: [
              FadeInRight(
                child: MyListTile(
                  leading: RandomAvatar(myUser.avatar, trBackground: true),
                  title: "Welcome ${myUser.name}",
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: FadeIn(
                  delay: const Duration(seconds: 3),
                  child: Consumer(
                    builder: (context, ref, child) => TextButton(
                      onPressed: () => ref.read(signOutProvider),
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      ),
                      child: const Text(
                        "LOG OUT",
                        style: TextStyle(fontSize: 12, color: Colors.white24),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        middleColor: Colors.deepPurpleAccent.shade200,
        openBuilder: (_, __) => Container(),
      );
}

class _PlayTournamentButton extends ConsumerWidget {
  const _PlayTournamentButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        context.router.push(const TournamentRoute());
      },
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        backgroundColor: MaterialStatePropertyAll(
          Colors.deepPurpleAccent.shade200,
        ),
      ),
      child: Container(
        width: 320.w,
        height: 60.h,
        alignment: Alignment.center,
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            ColorizeAnimatedText(
              'Play Tournament',
              textStyle: TextStyle(
                fontSize: 20.h,
                fontWeight: FontWeight.w700,
                color: Colors.white70,
              ),
              colors: Colors.primaries.map((e) => e.shade100).toList(),
              speed: const Duration(seconds: 3),
            ),
          ],
          isRepeatingAnimation: true,
          onTap: () {
            context.router.push(const TournamentRoute());
          },
        ),
      ),
    );
  }
}

class _DashboardSubHeader extends StatelessWidget {
  final String title;
  const _DashboardSubHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.h,
      padding: EdgeInsets.only(left: 8.w),
      alignment: Alignment.centerLeft,
      child: FittedBox(
        alignment: Alignment.centerLeft,
        child: AutoSizeText(
          title,
          style: const TextStyle(
            color: Colors.deepPurpleAccent,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
