import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:paricon/model/my_user.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../logic/user_datastore.dart';
import '../../theme/my_color.dart';

class RecentPlayer extends ConsumerWidget {
  const RecentPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FirestoreListView<MyUser>(
      query: ref
          .read(recentUserCollectionReference)
          .orderBy('currentTime', descending: true)
          .limit(50),
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 15.w),
      itemBuilder: (_, snapshot) => RecentPlayerTile(snapshot.data()),
    );
    /*return ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 15.w),
      children: List.generate(
        10,
        (index) => const RecentPlayerTile(),
      ),
    );*/
  }
}

class RecentPlayerTile extends StatelessWidget {
  final MyUser myUser;
  const RecentPlayerTile(this.myUser, {super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.9,
      child: LayoutBuilder(
        builder: (_, p1) {
          //final showAvatar = mockInteger(0, 1) == 0;
          final showAvatar = myUser.avatar.isNotEmpty;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: Stack(
                  children: [
                    Positioned(
                      width: p1.maxWidth,
                      height: p1.maxHeight * 0.72,
                      bottom: p1.maxWidth * 0.05,
                      child: const CircleAvatar(backgroundColor: majorelleBlue),
                    ),
                    if (showAvatar)
                      Positioned(
                        bottom: p1.maxWidth * 0.075,
                        height: p1.maxHeight * 0.8,
                        width: p1.maxWidth,
                        child: RandomAvatar(myUser.avatar, trBackground: true),
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
                  heightFactor: 0.87,
                  widthFactor: 1,
                  child: FittedBox(
                    child: Text(
                      toBeginningOfSentenceCase(myUser.name) ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Poppins',
                        color: richBlack,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
