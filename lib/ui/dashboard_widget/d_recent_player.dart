import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:paricon/logic/my_names.dart';
import 'package:paricon/model/my_user.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../logic/auth.dart';
import '../../logic/user_provider.dart';
import '../../model/p_user.dart';
import '../../theme/my_color.dart';

class RecentPlayer extends ConsumerWidget {
  const RecentPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User firebaseUser = ref.read(firebaseUserProvider);
    final PUser? pUser = ref.watch(pUserMeProvider).value;
    if (pUser == null) return Container();

    return FirestoreListView<PUser>(
      query: ref
          .watch(recentUserCollectionReferenceProvider)
          .orderBy('currentTime', descending: true)
          .limit(20),
      emptyBuilder: (_) => Center(
        child: Text(
          "No User Currently",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 15.r,
                color: gray,
              ),
        ),
      ),
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 15.w),
      //reverse: true,
      itemBuilder: (_, snapshot) {
        if (snapshot.id == firebaseUser.uid) return const SizedBox();
        return RecentPlayerTile(snapshot.data().myUser);
      },
    );
  }
}

class RecentPlayerTile extends StatelessWidget {
  final MyUser myUser;
  const RecentPlayerTile(this.myUser, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 67.5.w,
      //color: darkCyan,
      margin: EdgeInsets.symmetric(horizontal: 1.5.w),
      //constraints: const BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: myUser.avatar.isEmpty
                ? CircleAvatar(
                    radius: 30.r,
                    backgroundColor: majorelleBlue,
                    child: Text(
                      myUser.name.substring(0, 2).toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                        bottom: -1.5.r,
                        left: 0.r,
                        right: 0.r,
                        child: RandomAvatar(
                          myUser.avatar,
                          trBackground: true,
                          width: 30.r,
                          height: 30.r,
                        ),
                      )
                    ],
                  ),
          ),
          SizedBox.square(dimension: 4.5.r),
          Expanded(
            child: AutoSizeText(
              toBeginningOfSentenceCase(myUser.name) ?? "",
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 10.5.r,
                    height: 1.8.r,
                    fontFamily: 'Poppins',
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
    );
  }
}

class RecentPlayerTile1 extends StatelessWidget {
  final MyUser myUser;
  const RecentPlayerTile1(this.myUser, {super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.9,
      child: LayoutBuilder(
        builder: (_, p1) {
          //final showAvatar = mockInteger(0, 1) == 0;
          final showAvatar = myUser.avatar.isNotEmpty;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 4,
                  child: Stack(
                    children: [
                      Positioned(
                        width: p1.maxWidth,
                        height: p1.maxHeight * 0.72,
                        bottom: p1.maxWidth * 0.03,
                        child:
                            const CircleAvatar(backgroundColor: majorelleBlue),
                      ),
                      if (showAvatar)
                        Positioned(
                          bottom: p1.maxWidth * 0.075,
                          height: p1.maxHeight * 0.75,
                          width: p1.maxWidth,
                          child:
                              RandomAvatar(myUser.avatar, trBackground: true),
                        )
                      else
                        Center(
                          child: Text(
                            myUser.name.substring(0, 2).toUpperCase(),
                            //mockString(2).toUpperCase(),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 21.r,
                              color: melon,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                Flexible(
                  child: FractionallySizedBox(
                    heightFactor: 1,
                    widthFactor: 1,
                    child: AutoSizeText(
                      //toBeginningOfSentenceCase(myUser.name) ?? "",
                      "${myRandomName()} $myLastName",
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyLarge!,
                      maxFontSize: 12,
                      minFontSize: 9,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
