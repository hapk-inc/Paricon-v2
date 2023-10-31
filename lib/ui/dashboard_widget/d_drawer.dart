import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/auth.dart';
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
      child: myUser == null ? Container() : const InAppDrawer(),
    );
  }
}

class InAppDrawer extends ConsumerWidget {
  const InAppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser myUser = ref.read(myUserProvider).value!;
    final User firebaseUser = ref.read(firebaseUserProvider);
    return Padding(
      padding: EdgeInsets.only(left: 10.5.w, right: 4.5.w),
      child: Column(
        children: [
          Container(
            height: 45.h,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 10.5.h),
            child: Row(
              children: [
                Expanded(
                  child: AutoSizeText(
                    myUser.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: whiteSmoke),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.5.r),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.edit,
                      size: 21.r,
                      color: whiteSmoke,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Wrap(
              runSpacing: 9.h,
              children: [
                AutoSizeText(
                  myUser.id.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: whiteSmoke),
                ),
                Container(
                  width: 0.75.r,
                  height: 30.h,
                  alignment: Alignment.bottomCenter,
                  color: whiteSmoke,
                  margin: EdgeInsets.symmetric(horizontal: 7.5.w),
                ),
                AutoSizeText(
                  firebaseUser.email == null || firebaseUser.email!.isEmpty
                      ? "${myUser.name}@gmail.com".toLowerCase()
                      : firebaseUser.email!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: whiteSmoke),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Divider(
            color: azure,
            thickness: 0.6.r,
            indent: 7.5.w,
            endIndent: 7.5.w,
          ),
          Container(
            height: 30.h,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 15.h),
            padding: EdgeInsets.only(right: 7.5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Created on",
                  style: TextStyle(
                    color: azure,
                    fontFamily: 'Poppins',
                    fontSize: 13.5.r,
                  ),
                ),
                Text(
                  "31 October, 2023",
                  style: TextStyle(
                    color: cream,
                    fontFamily: 'Poppins',
                    fontSize: 15.r,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: azure,
            thickness: 0.6.r,
            indent: 7.5.w,
            endIndent: 7.5.w,
          ),
          Container(
            height: 30.h,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 15.h),
            padding: EdgeInsets.only(right: 7.5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Best Record",
                  style: TextStyle(
                    color: azure,
                    fontFamily: 'Poppins',
                    fontSize: 13.5.r,
                  ),
                ),
                AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "${myUser.bestDuration!.inMinutes.toString().padLeft(2, '0')}"
                            ": ${"${myUser.bestDuration!.inSeconds}".padLeft(2, '0')}",
                      ),
                      TextSpan(
                        text: " ${myUser.bestDuration!.inMilliseconds ~/ 100}",
                        style: TextStyle(
                          fontSize: 10.8.r,
                          color: cream.withOpacity(0.6),
                        ),
                      )
                    ],
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: cream,
                      fontSize: 18.r,
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: azure,
            thickness: 0.6.r,
            indent: 7.5.w,
            endIndent: 7.5.w,
          ),
          Container(
            height: 30.h,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 15.h),
            padding: EdgeInsets.only(right: 7.5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your Rank",
                  style: TextStyle(
                    color: azure,
                    fontFamily: 'Poppins',
                    fontSize: 13.5.r,
                  ),
                ),
                AutoSizeText.rich(
                  TextSpan(
                    text: "${mockInteger(1, 10)}".padLeft(2, '0'),
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: cream,
                      fontSize: 18.r,
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: azure,
            thickness: 0.6.r,
            indent: 7.5.w,
            endIndent: 7.5.w,
          ),
        ],
      ),
    );
  }
}

class InAppAvatarDrawer1 extends ConsumerWidget {
  const InAppAvatarDrawer1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser myUser = ref.read(myUserProvider).value!;
    final User firebaseUser = ref.read(firebaseUserProvider);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.5.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 45.h,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 10.5.h),
            child: Row(
              children: [
                Expanded(
                  child: AutoSizeText(
                    myUser.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: whiteSmoke),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.5.r),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.edit,
                      size: 21.r,
                      color: whiteSmoke,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Wrap(
              children: [
                AutoSizeText(
                  myUser.id.toString(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: whiteSmoke,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Poppins'),
                ),
                Container(
                  width: 0.9.r,
                  height: 30.h,
                  color: whiteSmoke,
                  margin: EdgeInsets.symmetric(horizontal: 7.5.w),
                ),
                AutoSizeText(
                  firebaseUser.email == null || firebaseUser.email!.isEmpty
                      ? "${myUser.name}@gmail.com".toLowerCase()
                      : firebaseUser.email!,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: whiteSmoke,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Poppins'),
                ),
                Container(
                  width: 0.9.r,
                  height: 30.h,
                  color: whiteSmoke,
                  margin: EdgeInsets.symmetric(horizontal: 7.5.w),
                ),
                /* AutoSizeText(
                  "Created at 30 October, 2023",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: cream,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Poppins'),
                ),*/
              ],
            ),
          ),
          SizedBox(height: 15.h),
          SizedBox(
            height: 420.h,
            child: FirestoreQueryBuilder<AvatarCard>(
              query: ref
                  .watch(avatarCardCollectionReference)
                  .orderBy('createdAt', descending: true)
                  .limit(15),
              builder: (_, snapshot, __) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                padding: EdgeInsets.all(3.r),
                itemCount: snapshot.docs.length,
                itemBuilder: (_, index) {
                  final String cardId = snapshot.docs[index].id;

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
            ),
          ),
          const ShareAvatarCodeBox(),
        ],
      ),
    );
  }
}

class ShareAvatarCodeBox extends StatelessWidget {
  const ShareAvatarCodeBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      decoration: BoxDecoration(
        color: russianViolet,
        borderRadius: BorderRadius.circular(7.5.r),
      ),
      padding: EdgeInsets.all(7.5.r),
      child: Column(
        children: [
          Text(
            "If you want more cards, "
            "invite your friends to use the code below",
            style: TextStyle(
              color: tropicalIndigo,
              fontSize: 13.5.r,
              height: 1.8,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 15.h),
          Expanded(
            child: Center(
              child: Text(
                mockString(6, 'A'),
                style: TextStyle(
                  color: columbiaBlue,
                  fontFamily: 'DelaGothic',
                  fontSize: 34.5.r,
                  letterSpacing: 3.r,
                ),
              ),
            ),
          ),
          Flexible(
            child: ButtonBar(
              buttonMinWidth: 15.w,
              buttonPadding: EdgeInsets.symmetric(horizontal: 3.r),
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    size: 18.r,
                    color: azure,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.whatsapp,
                    size: 21.r,
                    color: pigmentGreen,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.instagram,
                    size: 21.r,
                    color: Colors.pink,
                  ),
                )
              ],
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
          .watch(avatarCardCollectionReference)
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

class DrawerAvatarFlipCard extends ConsumerWidget {
  final AvatarCard aCard;
  final VoidCallback onFlipAction;
  const DrawerAvatarFlipCard(this.aCard, this.onFlipAction, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

    //final MyUser myUser = ref.watch(myUserProvider).value!;
    final String? avatar = ref.watch(avatarIDProvider).value;

    debugPrint(avatar);
    debugPrint(aCard.id);

    return FlipCard(
      flipOnTouch: false,
      onFlip: onFlipAction,
      key: cardKey,
      direction: FlipDirection.HORIZONTAL,
      side: aCard.id.isEmpty ? CardSide.BACK : CardSide.FRONT,
      back: Container(
        margin: EdgeInsets.all(1.5.r),
        child: ElevatedButton(
          onPressed: () => cardKey.currentState!.toggleCard(),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              [teaGreen, peach, lavenderPink][mockInteger(0, 2)],
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.5.r),
              ),
            ),
            padding:
                MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 3.r)),
          ),
          child: Text(
            "Click Here to view".toUpperCase(),
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w900,
              color: barnRed,
              fontSize: 13.5.r,
              height: 1.8,
              letterSpacing: 0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      front: aCard.id.isEmpty
          ? Container()
          : FadeIn(
              child: Stack(
                children: [
                  Center(
                    child: Badge(
                      isLabelVisible: avatar == aCard.id,
                      label: Icon(
                        Icons.done,
                        size: 24.r,
                        color: ghostWhite,
                      ),
                      smallSize: 30.r,
                      largeSize: 24.r,
                      backgroundColor: pigmentGreen,
                      child: RandomAvatar(aCard.id, width: 70.2.r),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
