import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../logic/s_size.dart';
import '../../logic/user_datastore.dart';
import '../../theme/my_color.dart';
import '../logic/auth.dart';
import '../logic/remote_values.dart';
import '../model/my_user.dart';
import '../my_widget/build_app_bar.dart';
import '../my_widget/daily_leaderboard.dart';
import '../router/my_route.dart';

@RoutePage()
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize sSize = ref.read(sizeProvider);
    final String inWork = ref.watch(inWorkProvider);
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final User fUser = ref.watch(firebaseUserProvider);

    return Scaffold(
      appBar: buildAppBar(sSize, context),
      backgroundColor: ghostWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(9.r),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: !inWork.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        inWork,
                        wrapWords: false,
                        style: TextStyle(
                          fontSize: 60.r,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: cadetGray,
                        ),
                      ),
                      SizedBox(height: 9.r),
                      Text(
                        "Appreciate your patience",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18.r,
                            fontWeight: FontWeight.w200,
                            color: gunMetal,
                            letterSpacing: .3.r),
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: StaggeredGrid.count(
                      crossAxisCount: 20,
                      mainAxisSpacing: 15.r,
                      crossAxisSpacing: 15.r,
                      children: [
                        if (DateTime.now()
                                .difference(fUser.metadata.creationTime!) <
                            const Duration(days: 1))
                          const StaggeredGridTile.count(
                            crossAxisCellCount: 20,
                            mainAxisCellCount: 9,
                            child: FirstTimeUser(),
                          ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 20,
                          mainAxisCellCount: 2.1,
                          child: Container(
                            //color: barnRed.withOpacity(0.21),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Recently Played",
                              style: TextStyle(
                                fontSize: 15.r,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                //fontStyle: FontStyle.italic,
                                color: sealBrown,
                              ),
                            ),
                          ),
                        ),
                        const StaggeredGridTile.count(
                          crossAxisCellCount: 20,
                          mainAxisCellCount: 19.5,
                          child: DailyLeaderBoard(),
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class FirstTimeUser extends StatelessWidget {
  const FirstTimeUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: magnolia,
      padding: EdgeInsets.all(7.5.r),
      alignment: Alignment.centerLeft,
      child: AutoSizeText.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "You have logged in "
                  "successfully.\n",
              style: TextStyle(
                fontSize: 30.r,
                height: 1.8,
                wordSpacing: 1.r,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w800,
                color: russianViolet,
              ),
            ),
            TextSpan(
              text: "It's time to",
              style: TextStyle(
                fontSize: 15.r,
                fontWeight: FontWeight.w700,
                color: battleshipGray,
              ),
            ),
            TextSpan(
              text: " play your first game.",
              style: const TextStyle(
                color: darkPastelGreen,
                fontWeight: FontWeight.w700,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.router.push(const TournamentRoute());
                },
            ),
          ],
          style: TextStyle(
              fontFamily: "Poppins",
              color: spaceCadet,
              fontSize: 18.r,
              height: 2.1),
        ),
        maxLines: 3,
      ),
    );
  }
}
