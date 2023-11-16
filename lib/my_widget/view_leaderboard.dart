import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/auth_provider.dart';
import '../logic/user_provider.dart';
import '../model/p_user.dart';
import '../theme/my_color.dart';
import 'show_t_score.dart';

class ViewLeaderBoard extends ConsumerWidget {
  const ViewLeaderBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 75.h,
            padding: EdgeInsets.symmetric(horizontal: 9.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "View LeaderBoard",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 21.r),
                ),
                IconButton(
                  iconSize: 21.r,
                  onPressed: () => context.router.pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          Expanded(
            child: FadeIn(
              delay: const Duration(seconds: 1),
              child: FirestoreQueryBuilder<PUser>(
                query: ref
                    .read(bestDurationCollReferenceProvider)
                    .where('bestDuration', isNull: false)
                    .orderBy('bestDuration'),
                builder: (BuildContext context,
                    FirestoreQueryBuilderSnapshot<PUser> snapshot,
                    Widget? child) {
                  return ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 9.w),
                    itemCount: snapshot.docs.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      final String id = snapshot.docs[index].id;
                      final PUser pUser = snapshot.docs[index].data();
                      return ViewLeaderBoardTile(id, index, pUser);
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ViewLeaderBoardTile extends ConsumerWidget {
  final String id;
  final PUser pUser;
  final int index;
  const ViewLeaderBoardTile(this.id, this.index, this.pUser, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(authUserProvider).value;
    final tTheme = Theme.of(context).textTheme.titleLarge;
    final sTheme = Theme.of(context).textTheme.bodyLarge;

    final DateTime cDate = pUser.createdAt ?? DateTime.now();
    final String createdAt = DateFormat.yMMMMd('en_US').format(cDate);

    if (user == null || pUser.bestDuration == null) return Container();
    final bool isMe = user.uid == id;
    final Color rColor = [bloodRed, hookerGreen][mockInteger(0, 1)];
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: isMe ? bitterSweet : null,
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 7.5.w),
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints.loose(Size.square(64.5.r)),
            decoration: BoxDecoration(
              color: majorelleBlue,
              borderRadius: BorderRadius.circular(7.5.r),
            ),
            alignment: Alignment.center,
            child: pUser.avatar == null
                ? AutoSizeText(
                    pUser.name.substring(0, 2).toUpperCase(),
                    style: tTheme!.copyWith(color: lightOrange),
                  )
                : Stack(
                    children: [
                      if (pUser.avatar != null)
                        Positioned(
                          top: 0,
                          bottom: -7.2.r,
                          left: 0,
                          right: 0,
                          child: RandomAvatar(
                            pUser.avatar!,
                            trBackground: true,
                          ),
                        )
                    ],
                  ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 9.w),
              dense: true,
              isThreeLine: true,
              title: AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "${index + 1}."),
                    TextSpan(text: " ", style: TextStyle(fontSize: 9.r)),
                    TextSpan(text: pUser.name),
                  ],
                ),
                style: tTheme!.copyWith(
                  color: isMe ? lightOrange : rColor,
                ),
                minFontSize: 15,
                maxFontSize: 21,
                maxLines: 1,
                stepGranularity: 3,
              ),
              subtitle: SizedBox(
                height: 30.h,
                child: AutoSizeText(
                  createdAt,
                  style: sTheme!.copyWith(
                      color: isMe
                          ? lightOrange
                          : chocolateCosmos.withOpacity(0.6)),
                  minFontSize: 9,
                  maxFontSize: 15,
                  maxLines: 1,
                  stepGranularity: 3,
                ),
              ),
              trailing: AutoSizeText.rich(
                TextSpan(
                  children: [
                    showTScore(pUser.bestDuration!,
                        minute: isMe ? lightOrange : rColor,
                        mm: isMe ? lightOrange : rColor,
                        tSize: 21,
                        sSize: 13.5)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ViewLeaderBoardTile1 extends ConsumerWidget {
  final String id;
  final PUser pUser;
  final int index;
  const ViewLeaderBoardTile1(this.id, this.index, this.pUser, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 96.h,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.3.r, color: charcoal)),
      ),
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 9.r),
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints.tight(Size.square(72.r)),
            decoration: BoxDecoration(
              color: majorelleBlue,
              borderRadius: BorderRadius.circular(7.5.r),
            ),
            margin: EdgeInsets.only(right: 10.8.r),
            child: Stack(
              children: [
                if (pUser.avatar != null)
                  Positioned(
                    top: 0,
                    bottom: -15.r,
                    left: 0,
                    right: 0,
                    child: RandomAvatar(pUser.avatar!, trBackground: true),
                  )
              ],
            ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 1.5.r),
              title: AutoSizeText(
                "${index + 1}. ${pUser.name}",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 21.r,
                      height: 2.1.r,
                      color: vanDyke,
                      fontFamily: 'Cabin',
                    ),
                maxLines: 1,
                minFontSize: 15,
                maxFontSize: 21,
              ),
              dense: false,
              isThreeLine: true,
              subtitle: AutoSizeText(
                "${pUser.tournamentPlayed} games Played",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.r,
                  fontWeight: FontWeight.w300,
                ),
                maxLines: 1,
              ),
              trailing: AutoSizeText.rich(
                showTScore(
                  pUser.bestDuration!,
                  minute: vanDyke,
                  mm: cinerous,
                  tSize: 21,
                  sSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
