import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../model/p_user.dart';
import '../theme/my_color.dart';

class RecentPlayer extends ConsumerWidget {
  const RecentPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;

    return myUser == null
        ? Container()
        : Container(
            alignment: Alignment.centerLeft,
            child: FirestoreListView<PUser>(
              shrinkWrap: true,
              query: ref.watch(
                recentUserCollectionReferenceProvider(myUser.id),
              ),
              emptyBuilder: (_) => Center(
                child: Text(
                  "No User Currently",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 15.r,
                        color: Colors.grey,
                      ),
                ),
              ),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 15.w),
              itemBuilder: (_, QueryDocumentSnapshot<PUser> doc) =>
                  RecentPlayerTile(doc.data()),
            ),
          );
  }
}

class RecentPlayerTile extends StatelessWidget {
  final PUser pUser;
  const RecentPlayerTile(this.pUser, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.w,
      //color: darkCyan,
      margin: EdgeInsets.symmetric(horizontal: 1.5.w),
      //constraints: const BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedOpacity(
            opacity: pUser.isActive ? 1 : 0.3,
            duration: const Duration(milliseconds: 500),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: pUser.avatar == null || pUser.avatar!.isEmpty
                  ? CircleAvatar(
                      radius: 30.r,
                      backgroundColor: majorelleBlue,
                      child: Text(
                        pUser.name.substring(0, 2).toUpperCase(),
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
          SizedBox.square(dimension: 4.5.r),
          Expanded(
            child: AutoSizeText(
              toBeginningOfSentenceCase(pUser.name) ?? "",
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
