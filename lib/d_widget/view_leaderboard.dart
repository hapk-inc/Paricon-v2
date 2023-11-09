import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../logic/auth_provider.dart';
import '../logic/user_provider.dart';
import '../model/p_user.dart';
import '../my_widget/show_t_score.dart';
import '../theme/my_color.dart';

class ViewLeaderBoard extends ConsumerWidget {
  const ViewLeaderBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? firebaseUser = ref.watch(authUserProvider).value;

    return SafeArea(
      child: ColoredBox(
        color: lightOrange,
        child: firebaseUser == null
            ? Container()
            : Container(
                padding: EdgeInsets.all(9.r),
                child: FirestoreQueryBuilder<PUser>(
                  query: ref
                      .read(bestDurationCollReferenceProvider)
                      .where('bestDuration', isNull: false)
                      .orderBy('bestDuration'),
                  builder: (BuildContext context,
                      FirestoreQueryBuilderSnapshot<PUser> snapshot,
                      Widget? child) {
                    return Column(
                      children: [
                        Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: charcoal,
                                width: 0.45.r,
                              ),
                            ),
                          ),
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 18.r,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              color: giantOrange,
                            ),
                            child: Row(
                              children: [
                                const Flexible(
                                    fit: FlexFit.tight, child: Text("Rank")),
                                const Flexible(
                                    flex: 3,
                                    fit: FlexFit.tight,
                                    child: Text("Name")),
                                Flexible(
                                  flex: 2,
                                  fit: FlexFit.tight,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Duration"),
                                      InkWell(
                                        onTap: () => context.router.pop(),
                                        child: Icon(
                                          Icons.close,
                                          color: charcoal,
                                          size: 21.r,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              {
                                final String i = snapshot.docs[index].id;
                                final bool isMe = firebaseUser.uid == i;
                                final PUser pUser = snapshot.docs[index].data();

                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(7.5.r),
                                  child: Container(
                                    height: 66.h,
                                    decoration: BoxDecoration(
                                      color: isMe ? bitterSweet : null,
                                      border: isMe
                                          ? null
                                          : Border(
                                              bottom: BorderSide(
                                                color: charcoal,
                                                width: 0.3.r,
                                              ),
                                            ),
                                    ),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 18.r,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        color: isMe ? lightOrange : giantOrange,
                                      ),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            fit: FlexFit.tight,
                                            child: Center(
                                              child: Text(
                                                "${index + 1}".padLeft(2, '0'),
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 15.r,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 3,
                                            fit: FlexFit.tight,
                                            child: Row(
                                              children: [
                                                AutoSizeText(
                                                  pUser.name,
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16.r,
                                                  ),
                                                ),
                                                if (index == 0)
                                                  Expanded(
                                                    child: Lottie.asset(
                                                        'lottie/trophy.json'),
                                                  )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: AutoSizeText.rich(
                                              showTScore(
                                                pUser.bestDuration!,
                                                minute: isMe
                                                    ? lightOrange
                                                    : caputMortuum,
                                                mm: isMe
                                                    ? lightOrange
                                                    : oldRose,
                                              ),
                                              style: TextStyle(fontSize: 18.r),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
      ),
    );
  }
}
