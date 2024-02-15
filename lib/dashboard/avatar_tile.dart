import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';

import 'package:random_avatar/random_avatar.dart';

import '../logic/auth_provider.dart';
import '../logic/pass_avatar_provider.dart';
import '../logic/tournament_database.dart';
import '../logic/user_provider.dart';
import '../model/d_avatar.dart';
import '../model/my_user.dart';
import '../theme/my_color.dart';

class AvatarTile extends ConsumerWidget {
  final QueryDocumentSnapshot<DAvatar> doc;
  const AvatarTile(this.doc, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final User? user = ref.watch(authUserProvider).value;

    bool isMyAvatar =
        (myUser?.avatar ?? "") == (doc.data().avatar ?? mockString(10));

    bool isMe = (user?.uid ?? "") == doc.id;

    return AnimatedOpacity(
      opacity: doc.data().avatar == null
          ? 1
          : isMyAvatar
              ? 1
              : 0.15,
      duration: const Duration(milliseconds: 500),
      child: Card(
        margin: EdgeInsets.all(3.r),
        elevation: 3.r,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.2.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.5.r),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  color: [...gridColorDark, ...gridColor][mockInteger(0, 5)],
                  child: Stack(
                    children: [
                      if (doc.data().avatar != null)
                        Positioned.fill(
                          bottom: -24.r,
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 300),
                            child: InkWell(
                              onTap: () => ref.watch(updateFaceAvatarProvider(
                                  doc.data().avatar ?? mockString(1))),
                              child: RandomAvatar(
                                doc.data().avatar ?? mockString(1),
                                trBackground: true,
                              ),
                            ),
                          ),
                        )
                      else
                        Positioned(
                          bottom: 7.5.r,
                          height: 75.h,
                          left: 7.5.r,
                          right: 7.5.r,
                          child: Container(
                            decoration: BoxDecoration(
                                color: ghostWhite,
                                borderRadius: BorderRadius.circular(4.5.r)),
                            padding: EdgeInsets.symmetric(horizontal: 4.5.r),
                            child: ListTile(
                              onTap: isMyAvatar
                                  ? null
                                  : () =>
                                      ref.watch(getNewAvatarProvider(doc.id)),
                              contentPadding: EdgeInsets.zero,
                              titleTextStyle: TextStyle(
                                fontSize: 9.r,
                                color: gray,
                                fontFamily: 'Poppins',
                              ),
                              title: Text(isMe ? "Earn your" : "Shared by"),
                              subtitleTextStyle: TextStyle(
                                  fontSize: 15.r,
                                  color: richBlack,
                                  fontFamily: 'Montserrat'),
                              subtitle: Text(
                                isMe
                                    ? "First Avatar"
                                    : ref
                                        .watch(xPlayerProvider(doc.id))
                                        .maybeWhen(
                                          orElse: () => "",
                                          data: (data) => data?.name ?? "",
                                        ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        //padding: EdgeInsets.all(3.r),
      ),
    );
  }
}

/*child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Shared by",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 7.5.r,
                                  color: richBlack,
                                ),
                              ),
                              Gap(4.5.r),
                              AutoSizeText(
                                myRandomName(),
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 13.5.r,
                                  color: gray,
                                ),
                              ),
                            ],
                          ),*/
