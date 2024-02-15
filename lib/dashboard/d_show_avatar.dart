import 'package:animated_emoji/animated_emoji.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

import '../logic/dashboard_provider.dart';
import '../logic/user_activity_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../model/pass_avatar.dart';
import '../theme/my_color.dart';

import 'avatar_tile.dart';
import 'copy_code_button.dart';
import 'pass_avatar_dialog.dart';
import 'pass_avatar_list_tile.dart';

class ShowAvatar extends ConsumerWidget {
  const ShowAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;

    final tTheme = Theme.of(context).textTheme;

    return ColoredBox(
      color: ghostWhite1,
      child: StaggeredGrid.count(
        crossAxisCount: 20,
        children: [
          StaggeredGridTile.fit(
            crossAxisCellCount: 20,
            child: Container(
              height: 51.h,
              margin: EdgeInsets.only(bottom: 6.h),
              alignment: Alignment.center,
              color: magnolia,
              child: ListTile(
                leadingAndTrailingTextStyle: TextStyle(
                  fontSize: 18.r,
                  color: federalBlue,
                  fontFamily: 'WendyOne',
                  letterSpacing: 0,
                ),
                leading: const Text("My Cards"),
                dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                trailing: Text(
                  (myUser?.avatarArr ?? []).length.toString().padLeft(2, '0'),
                  style: const TextStyle(fontFamily: 'Montserrat'),
                ),
              ),
            ),
          ),
          const DAvatarGridView(),
          Gap(15.r),
          StaggeredGridTile.fit(
            crossAxisCellCount: 20,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
              title: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: SizedBox.square(
                        dimension: 30.r,
                        child: AnimatedEmoji(
                          AnimatedEmojis.smile,
                          errorWidget: Center(
                            child: Text("😎", style: TextStyle(fontSize: 30.r)),
                          ),
                        ),
                      ),
                    ),
                    WidgetSpan(child: SizedBox.square(dimension: 12.r)),
                    const TextSpan(text: "Earn a new avatar")
                  ],
                  style: tTheme.bodyMedium!.copyWith(color: darkPurple),
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
              titleAlignment: ListTileTitleAlignment.center,
              subtitleTextStyle: tTheme.bodySmall!
                  .copyWith(color: coolGray, fontWeight: FontWeight.w300),
              subtitle: Text(
                ref.read(shareCodeProvider),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          StaggeredGridTile.fit(
            crossAxisCellCount: 20,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
              height: 48.r,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.5.r),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 225.w,
                      decoration: BoxDecoration(
                        color: isabelline,
                        border: Border.all(color: vermilion, width: 0.3.r),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7.5.r),
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          myUser?.avatarCode ?? "",
                          key: ValueKey(myUser?.avatarCode ?? ""),
                          style: TextStyle(fontSize: 21.r),
                        ),
                      ),
                    ),
                    const Expanded(child: CopyCodeButton())
                  ],
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
              crossAxisCellCount: 20,
              mainAxisCellCount: 0.9,
              child: Center(
                child: InkWell(
                  onTap: () => showGeneralDialog(
                    context: context,
                    pageBuilder: (_, __, ___) => Container(),
                    barrierDismissible: true,
                    barrierLabel: "passAvatar",
                    transitionBuilder: (ctx, a1, a2, child) {
                      double curve = Curves.easeInOut.transform(a1.value);
                      return Transform.scale(
                        scale: curve,
                        child: const PassAvatarDialog(),
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 300),
                    //builder: (_) => const PassAvatarDialog(),
                  ),
                  child: Text.rich(
                    const TextSpan(
                      children: [
                        TextSpan(
                            text: "Tap here ",
                            style: TextStyle(color: darkPastelGreen)),
                        TextSpan(text: "to paste avatar code"),
                      ],
                    ),
                    style: TextStyle(
                      color: coolGray,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Poppins',
                      fontSize: 12.r,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          Gap(15.r),
          StaggeredGridTile.fit(
            crossAxisCellCount: 20,
            child: Container(
              height: 300.h,
              alignment: Alignment.center,
              //color: crayola,
              child: FirebaseAnimatedList(
                query: ref.read(passAvatarQueryProvider),
                physics: const NeverScrollableScrollPhysics(),
                sort: (a, b) {
                  final PassAvatar x = PassAvatar.fromSnapshot(a);
                  final PassAvatar y = PassAvatar.fromSnapshot(b);
                  return y.createdAt.compareTo(x.createdAt);
                },

                //reverse: true,
                itemBuilder: (_, DataSnapshot snapshot, animation, index) {
                  PassAvatar passAvatar = PassAvatar.fromSnapshot(snapshot);
                  return PassAvatarListTile(passAvatar);
                },
              ),
            ),
          ),
          Gap(15.r),
        ],
      ),
    );
  }
}

class DAvatarGridView extends ConsumerWidget {
  const DAvatarGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myDAvatarQuery = ref.read(myDAvatarQueryProvider);

    return StaggeredGridTile.count(
      crossAxisCellCount: 20,
      mainAxisCellCount: 7.2,
      child: FirestoreQueryBuilder(
        query: myDAvatarQuery,
        builder: (_, snapshot, __) => GridView.custom(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 7.5.w),
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 1,
            mainAxisSpacing: .15.r,
            crossAxisSpacing: .15.r,
            pattern: [const WovenGridTile(1, crossAxisRatio: 0.9)],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (_, index) => AvatarTile(snapshot.docs[index]),
            childCount: snapshot.docs.length,
          ),
        ),
      ),
    );
  }
}
