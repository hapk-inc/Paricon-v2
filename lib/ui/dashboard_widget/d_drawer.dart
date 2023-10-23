import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../logic/card_avatar.dart';
import '../../logic/user_datastore.dart';
import '../../model/avatar_card.dart';
import '../../model/my_user.dart';
import '../../theme/my_color.dart';

class DDrawer extends ConsumerWidget {
  const DDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    return AnimatedSwitcher(
      duration: const Duration(microseconds: 500),
      child: myUser == null
          ? Container()
          : Column(
              children: [
                Container(
                  height: 90.h,
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 7.5.r),
                    // tileColor: Colors.red,
                    title: AutoSizeText(
                      myUser.name,
                      style: TextStyle(
                        fontSize: 27.r,
                        fontFamily: 'DelaGothic',
                        fontWeight: FontWeight.w700,
                        color: mistyRose,
                      ),
                    ),
                    subtitle: Container(
                      margin: EdgeInsets.only(top: 9.r),
                      child: AutoSizeText(
                        "Change the Paricon in-app icon",
                        style: TextStyle(
                          fontFamily: 'Cabin',
                          fontSize: 12.r,
                          color: mistyRose,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  height: 450.h,
                  color: deepSkyBlue.withOpacity(0.12),
                  child: const MyCardCollection(),
                ),
                Container(
                  height: 90.h,
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 4.5.r),
                    // tileColor: Colors.red,
                    subtitleTextStyle: TextStyle(
                        fontSize: 27.r,
                        height: 2.1,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 3.r),

                    subtitle: AutoSizeText(
                      mockString(6).toUpperCase(),
                      style: const TextStyle(color: mistyRose),
                    ),

                    titleTextStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12.r,
                      height: 1.8,
                      color: mistyRose,
                    ),
                    title: const Text(
                      "If you want more cards, "
                      "invite your friends to use the code below",
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class MyCardCollection extends ConsumerWidget {
  const MyCardCollection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FirestoreQueryBuilder<AvatarCard>(
      query: ref
          .read(avatarCardCollectionReference)
          .orderBy('createdAt', descending: true)
          .limit(50),
      builder: (_, snapshot, __) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        padding: EdgeInsets.all(3.r),
        itemCount: snapshot.docs.length,
        itemBuilder: (_, index) {
          final String cardId = snapshot.docs[index].id;
          debugPrint("71--$cardId");
          final AvatarCard aCard = snapshot.docs[index].data();
          return DrawerAvatarFlipCard(
            aCard,
            () async {
              debugPrint("onFlip");
              ref.read(setCardAvatarProvider(cardId));
            },
          );
        },
      ),
    );
  }
}

class DrawerAvatarFlipCard extends StatelessWidget {
  final AvatarCard aCard;
  final VoidCallback onFlipAction;
  const DrawerAvatarFlipCard(this.aCard, this.onFlipAction, {super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

    return FlipCard(
      flipOnTouch: false,
      onFlip: onFlipAction,
      key: cardKey,
      direction: FlipDirection.HORIZONTAL,
      side: aCard.id.isEmpty ? CardSide.BACK : CardSide.FRONT,
      back: Container(
        margin: EdgeInsets.all(1.5.r),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(columbiaBlue),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.5.r),
              ),
            ),
            alignment: Alignment.bottomCenter,
            padding: MaterialStatePropertyAll(
              EdgeInsets.only(bottom: 15.r),
            ),
          ),
          onPressed: () => cardKey.currentState!.toggleCard(),
          child: Text(
            'Click Here',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12.r,
              color: umber,
            ),
          ),
        ),
      ),
      front: aCard.id.isEmpty
          ? Container()
          : FadeIn(
              child: Padding(
                padding: EdgeInsets.all(9.r),
                child: RandomAvatar(aCard.id),
              ),
            ),
    );
  }
}
