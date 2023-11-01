import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
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
import '../../theme/my_color.dart';

class ShowTodayAvatar extends ConsumerWidget {
  const ShowTodayAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: const BoxDecoration(color: sealBrown),
      padding: EdgeInsets.all(15.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 7.5.h),
            child: Row(
              children: [
                Text(
                  "My Avatar Collection",
                  style: TextStyle(
                    color: citron,
                    fontSize: 21.r,
                    fontFamily: 'DelaGothic',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Expanded(
            child: FirestoreListView(
              scrollDirection: Axis.horizontal,
              query: ref
                  .watch(avatarCardCollectionReference)
                  .orderBy('createdAt', descending: true),
              itemBuilder: (BuildContext context,
                  QueryDocumentSnapshot<AvatarCard> doc) {
                final AvatarCard aCard = doc.data();
                final ConfettiController confettiController =
                    ConfettiController(
                        duration: const Duration(milliseconds: 500));

                final GlobalKey<FlipCardState> cardKey =
                    GlobalKey<FlipCardState>();

                List<Color> xRandom = [turquoise, pear, hunyadiYellow, salmon];
                xRandom.shuffle();

                return SizedBox(
                  width: 96.w,
                  child: SlideInLeft(
                    child: FadeIn(
                      child: FlipCard(
                        key: cardKey,
                        flipOnTouch: true,
                        front: InkWell(
                          onTap: () {
                            debugPrint("onClick New Card");

                            cardKey.currentState!.toggleCard();
                          },
                          child: const ShowAvatarCardFront(),
                        ),
                        back: AnimatedContainer(
                          duration: const Duration(milliseconds: 450),
                          decoration: BoxDecoration(
                            color: xRandom[mockInteger(0, 3)].withOpacity(0.75),
                            borderRadius: BorderRadius.circular(4.5.r),
                          ),
                          child: Stack(
                            children: [
                              if (aCard.id.isNotEmpty)
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 500),
                                  left: -7.5.r,
                                  bottom: -10.5.r,
                                  height: 120.r,
                                  width: 120.r,
                                  child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 500),
                                    child: RandomAvatar(
                                      aCard.id.isEmpty ? "abc" : aCard.id,
                                      trBackground: true,
                                    ),
                                  ),
                                ),
                              ConfettiWidget(
                                confettiController: confettiController,
                                blastDirectionality:
                                    BlastDirectionality.explosive,
                                colors: xRandom,
                                blastDirection: -pi,
                                numberOfParticles: 50, // the colors to be used
                              ),
                            ],
                          ),
                        ),
                        onFlipDone: (bool flag) {
                          debugPrint("onFlipDone $flag");
                          if (flag) {
                            confettiController.play();
                            ref.read(setCardAvatarProvider(doc.id));
                          }
                        },
                        side: aCard.id.isNotEmpty
                            ? CardSide.BACK
                            : CardSide.FRONT,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ShowTodayAvatarCard extends ConsumerWidget {
  const ShowTodayAvatarCard(
      {super.key, required this.aCard, required this.docId});

  final AvatarCard aCard;
  final String docId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ConfettiController confettiController =
        ConfettiController(duration: const Duration(milliseconds: 500));

    final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

    List<Color> xRandom = [turquoise, pear, hunyadiYellow, salmon];
    xRandom.shuffle();

    return SizedBox(
      width: 96.w,
      child: SlideInLeft(
        child: FadeIn(
          child: FlipCard(
            key: cardKey,
            onFlip: () {
              ref.read(setCardAvatarProvider(docId));
            },
            flipOnTouch: true,
            front: InkWell(
              onTap: () {
                debugPrint("onClick New Card");

                cardKey.currentState!.toggleCard();
              },
              child: const ShowAvatarCardFront(),
            ),
            back: AnimatedContainer(
              duration: const Duration(milliseconds: 450),
              decoration: BoxDecoration(
                color: xRandom[mockInteger(0, 3)].withOpacity(0.75),
                borderRadius: BorderRadius.circular(4.5.r),
              ),
              child: Stack(
                children: [
                  if (aCard.id.isNotEmpty)
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
                      left: -7.5.r,
                      bottom: -10.5.r,
                      height: 120.r,
                      width: 120.r,
                      child: RandomAvatar(
                        aCard.id.isEmpty ? "abc" : aCard.id,
                        trBackground: true,
                      ),
                    ),
                  ConfettiWidget(
                    confettiController: confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    colors: xRandom,
                    blastDirection: -pi,
                    numberOfParticles: 50, // the colors to be used
                  ),
                ],
              ),
            ),
            onFlipDone: (bool flag) {
              debugPrint("onFlipDone $flag");
              if (flag) {
                confettiController.play();
              }
            },
            side: aCard.id.isNotEmpty ? CardSide.BACK : CardSide.FRONT,
          ),
        ),
      ),
    );
  }
}

class ShowAvatarCardFront extends StatelessWidget {
  const ShowAvatarCardFront({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: citron,
        borderRadius: BorderRadius.circular(4.5.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/pi_icon_yellow.png',
            width: 60.r,
            height: 60.r,
          ),
          SizedBox(height: 15.h),
          Text(
            "Tap to view",
            style: TextStyle(
              color: sealBrown,
              fontSize: 12.r,
              fontFamily: 'DelaGothic',
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
