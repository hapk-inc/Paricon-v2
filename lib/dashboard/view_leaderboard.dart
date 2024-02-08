import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:paricon/theme/my_theme.dart';

import '../logic/auth_provider.dart';
import '../logic/t_score.dart';
import '../logic/tournament_database.dart';
import '../model/best_d.dart';
import '../theme/my_color.dart';

final _listKey = GlobalKey<AnimatedListState>();

class ViewLeaderBoard extends ConsumerWidget {
  //final void Function({Object? returnValue}) action;

  const ViewLeaderBoard(/*this.action,*/ {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(authUserProvider).value;
    if (user == null) return Container();
    return SafeArea(
      //minimum: EdgeInsets.symmetric(horizontal: 7.5.r),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: ref.watch(viewLeaderBoardProvider).when(
            data: (d) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.5.r),
                  color: lightOrange,
                  child: Column(
                    children: [
                      Gap(15.r),
                      SizedBox(
                        height: 60.h,
                        //color: xantHous,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: Icon(Icons.close,
                                  size: 21.r, color: caputMortuum),
                            ),
                            Text(
                              "View LeaderBoard",
                              style: TextStyle(
                                  color: caputMortuum, fontSize: 21.r),
                            )
                          ],
                        ),
                      ),
                      const ViewLeaderBoardHeader(),
                      //  Divider(color: gray, thickness: 0.45.r),
                      Expanded(
                        child: AnimatedList(
                          key: _listKey,
                          itemBuilder:
                              (_, int index, Animation<double> animation) {
                            final BestD best = d.values.elementAt(index);
                            final String xID = d.keys.elementAt(index);
                            final bool isMe = xID == user.uid;
                            return Container(
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: isMe ? giantOrange : lightOrange,
                                borderRadius: BorderRadius.circular(3.r),
                                border: Border(
                                  bottom: BorderSide(width: 0.24.r),
                                ),
                              ),
                              child: DefaultTextStyle(
                                style: TextStyle(
                                  fontSize: 15.r,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  color: caputMortuum,
                                ),
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 7.2.r),
                                        alignment: Alignment.centerLeft,
                                        child: AnimatedFlipCounter(
                                          value: (index + 1),
                                          wholeDigits: 2,
                                          textStyle: TextStyle(
                                              color: isMe
                                                  ? lightOrange
                                                  : caputMortuum),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 10,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: ref
                                            .watch(xPlayerProvider(xID))
                                            .maybeWhen(
                                              data: (a) => AnimatedSwitcher(
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                child: a == null
                                                    ? Container()
                                                    : Text(
                                                        firstCaps(a.name),
                                                        style: TextStyle(
                                                          color: isMe
                                                              ? lightOrange
                                                              : caputMortuum,
                                                        ),
                                                      ),
                                              ),
                                              orElse: () => Container(),
                                            ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 7,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: AutoSizeText.rich(
                                          showTScore(
                                            best.bestD,
                                            tSize: 15,
                                            sSize: 10.8,
                                            //family: 'WendyOne',
                                            minute: isMe
                                                ? lightOrange
                                                : caputMortuum,
                                            mm: isMe ? lightOrange : oldRose,
                                          ),
                                          maxLines: 1,
                                          style:
                                              TextStyle(letterSpacing: 0.3.r),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          initialItemCount: d.length,
                        ),
                      ),
                    ],
                  ),
                ),
            error: (e, s) => Container(),
            loading: () => Container()),
      ),
    );
  }
}

class ViewLeaderBoardHeader extends StatelessWidget {
  const ViewLeaderBoardHeader({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 36.h,
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 16.5.r,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            color: giantOrange,
          ),
          child: const Row(
            children: [
              Flexible(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Rank"),
                ),
              ),
              Flexible(
                flex: 10,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Name"),
                ),
              ),
              Flexible(
                flex: 7,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Duration"),
                ),
              ),
            ],
          ),
        ),
      );
}
