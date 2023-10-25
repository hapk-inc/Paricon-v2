import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      child: myUser == null ? Container() : const InAppAvatarDrawer(),
    );
  }
}

class InAppAvatarDrawer extends ConsumerWidget {
  const InAppAvatarDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser myUser = ref.read(myUserProvider).value!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.5.r),
      child: Column(
        children: [
          Container(
            height: 60.h,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Expanded(
                  child: AutoSizeText(
                    myUser.name,
                    style: TextStyle(
                      fontSize: 30.r,
                      fontFamily: 'DelaGothic',
                      color: whiteSmoke,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.5.r),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.edit,
                      size: 24.r,
                      color: whiteSmoke,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 30.h,
            //  color: redWood,
            alignment: Alignment.centerLeft,
            child: const AutoSizeText(
              "Replace the in-app avatar with a new image",
              style: TextStyle(
                color: whiteSmoke,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
              ),
              maxLines: 1,
              minFontSize: 6,
              maxFontSize: 15,
              stepGranularity: 1.5,
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

/*Column(
      children: [
        Container(
          height: 90.h,
          alignment: Alignment.centerLeft,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 7.5.r),
            // tileColor: Colors.red,
            title: Row(
              children: [
                AutoSizeText(
                  myUser.name,
                  style: TextStyle(
                    fontSize: 27.r,
                    fontFamily: 'DelaGothic',
                    fontWeight: FontWeight.w700,
                    color: mistyRose,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    debugPrint("Edit Press");
                  },
                  splashRadius: 1.r,
                  icon: Icon(
                    Icons.edit,
                    size: 24.r,
                    color: spaceCadet,
                  ),
                )
              ],
            ),
            subtitle: Container(
              margin: EdgeInsets.only(top: 9.r),
              child: AutoSizeText(
                "Change the Paricon in-app icon",
                style: TextStyle(
                  fontFamily: 'Cabin',
                  fontSize: 12.r,
                  color: periwinkle,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 105.h,
          margin: EdgeInsets.symmetric(vertical: 15.h),
          child: const MyCardCollection(),
        ),
        Container(
          height: 135.h,
          alignment: Alignment.centerLeft,
          child: ListTile(
            contentPadding: EdgeInsets.only(left: 10.5.r, right: 4.5.r),
            // tileColor: Colors.red,
            subtitleTextStyle: TextStyle(
              fontSize: 30.r,
              height: 2.1,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              letterSpacing: 2.4.r,
            ),

            subtitle: SizedBox(
              height: 60.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    mockString(6, 'A'),
                    style: TextStyle(
                      color: mistyRose,
                      fontFamily: 'DelaGothic',
                      fontSize: 45.r,
                    ),
                  ),
                  SizedBox.square(dimension: 10.5.r),
                  Icon(
                    Icons.share,
                    size: 18.r,
                    color: magnolia,
                  ),
                ],
              ),
            ),

            titleTextStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12.r,
              height: 2.1,
              color: magnolia,
            ),
            title: const Text(
              "If you want more cards, "
              "invite your friends to use the code below",
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        /*Padding(
            padding: EdgeInsets.only(left: 10.5.r, right: 4.5.r),
            // tileColor: Colors.red,

            child: AutoSizeText.rich(
              TextSpan(
                children: [
                  const TextSpan(text: "or "),
                  TextSpan(
                    text: "Click here",
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: TextStyle(
                      fontSize: 18.r,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1.2,
                    ),
                  ),
                  const TextSpan(
                    text: "  to enter a code and"
                        " offer new avatars to your friends.",
                    style: TextStyle(fontFamily: 'Poppins'),
                  )
                ],
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12.r,
                  height: 2.4,
                  color: pear1,
                ),
              ),
            ),
          ),*/
      ],
    )*/

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
