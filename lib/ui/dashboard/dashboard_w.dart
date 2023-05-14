import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/auth.dart';
import 'package:paricon/my_widgets/my_names.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../my_widgets/my_list_tile.dart';
import '../../my_widgets/today_leaderboard_list_view.dart';
import 'dashboard_p.dart';

class DashboardW extends ConsumerWidget {
  const DashboardW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Container(
          width: 60,
          color: Colors.deepPurple.shade100,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.rightFromBracket,
                  size: 32,
                  color: Colors.deepPurple,
                ),
                onPressed: () => ref.read(signOutProvider),
              )
            ],
          ),
        )
      ],
    );
  }
}

class DashboardW1 extends ConsumerWidget {
  const DashboardW1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Space10(),
              SizedBox(
                height: 140.h,
                //color: Colors.teal,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      6,
                      (index) => SizedBox(
                            width: 120.h,
                            //color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 6,
                                  child: CircleAvatar(
                                    radius: 45.h,
                                    child: RandomAvatar(mockString()),
                                  ),
                                ),
                                const Space10(),
                                Flexible(
                                  flex: 2,
                                  child: AutoSizeText(
                                    myRandomName(),
                                    style: const TextStyle(fontSize: 10),
                                    maxFontSize: 12,
                                    minFontSize: 9,
                                    maxLines: 1,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: AutoSizeText(
                                    myRandomName(),
                                    style: const TextStyle(fontSize: 10),
                                    maxFontSize: 12,
                                    minFontSize: 9,
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            ),
                          )),
                ),
              ),
              const Space20(),
              Row(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        DashboardSubHeader(title: "Today's Leaderboard"),
                        Space20(),
                        TodayLeaderBoardListView(),
                        PlayTournamentButton()
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
