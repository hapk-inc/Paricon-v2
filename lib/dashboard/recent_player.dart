import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/auth_provider.dart';
import '../logic/dashboard_provider.dart';
import '../logic/panel_provider.dart';
import '../logic/remote_values.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../model/p_user.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';
import 'p_panel.dart';

class RecentPlayer extends ConsumerWidget {
  const RecentPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final User? fUser = ref.watch(authUserProvider).value;

    final bool showTile = myUser == null || fUser == null;
    final int rCount = ref.watch(recentCountProvider);
    final asyncRecent = ref.watch(recentUserCollectionReferenceProvider);
    final PGroupOption pGroup = ref.watch(pGroupOptionProvider);
    debugPrint("rCount $rCount");
    return showTile
        ? Container()
        : AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            alignment: Alignment.centerLeft,
            child: FirestoreQueryBuilder<PUser>(
              query: asyncRecent,
              builder: (__, FirestoreQueryBuilderSnapshot<PUser> snapshot, _) {
                List<QueryDocumentSnapshot<PUser>> docs = snapshot.docs;
                List<QueryDocumentSnapshot<PUser>> withoutMe =
                    List.of(docs.where((doc) => doc.id != fUser.uid));

                List<QueryDocumentSnapshot<PUser>> updated;

                final meFriends = myUser.myFriends;

                if (pGroup == PGroupOption.friends) {
                  updated = List.from(
                    withoutMe.where(
                      (doc) {
                        final List<String> y = doc.data().myFriends;
                        return meFriends.contains(doc.id) &&
                            y.contains(fUser.uid);
                      },
                    ),
                  );
                } else {
                  updated = withoutMe;
                }

                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 9.w),
                  itemBuilder: (_, int index) {
                    QueryDocumentSnapshot<PUser> doc = withoutMe[index];
                    return RecentPlayerTile(doc.id, doc.data());
                  },
                  itemCount: updated.length,
                );
              },
            ),
          );
  }
}

class RecentPlayerTile extends ConsumerWidget {
  final String id;
  final PUser pUser;
  const RecentPlayerTile(this.id, this.pUser, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pTheme = SlidingPanelTheme();
    return SlideInRight(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: 65.1.w,
        margin: EdgeInsets.symmetric(horizontal: 1.5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: pUser.isActive ? 1 : 0.3,
              duration: const Duration(milliseconds: 500),
              child: InkWell(
                onTap: () {
                  ref.watch(dPanelWidgetProvider.notifier).state = Container(
                    height: 300.h,
                    decoration: BoxDecoration(
                      borderRadius: pTheme.slidingPanelRadius,
                      color: ghostWhite,
                    ),
                    child: PPanel(id, pUser: pUser),
                  );
                  ref.read(dashboardPanelProvider).open();
                },
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: pUser.avatar == null || pUser.avatar!.isEmpty
                      ? CircleAvatar(
                          radius: 30.r,
                          backgroundColor: majorelleBlue,
                          child: Text(
                            pUser.name.substring(0, 2).toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: lightOrange,
                                  fontSize: 24.r,
                                ),
                          ),
                        )
                      : Stack(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 30.r,
                                backgroundColor: majorelleBlue,
                              ),
                            ),
                            Positioned(
                              top: -3.r,
                              bottom: -7.5.r,
                              left: 0.r,
                              right: 0.r,
                              child: RandomAvatar(
                                pUser.avatar!,
                                trBackground: true,
                                width: 30.r,
                                height: 30.r,
                              ),
                            )
                          ],
                        ),
                ),
              ),
            ),
            Gap(6.r),
            Expanded(
              child: AutoSizeText(
                toBeginningOfSentenceCase(pUser.name) ?? "",
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 9.6.r,
                      height: 1.8.r,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w300,
                    ),
                wrapWords: false,
                maxFontSize: 12,
                minFontSize: 9,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
