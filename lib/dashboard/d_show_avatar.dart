import 'package:animate_do/animate_do.dart';
import 'package:animated_emoji/animated_emoji.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';

import '../logic/card_notifier.dart';
import '../logic/pass_avatar_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../model/pass_avatar.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

class ShowAvatar extends ConsumerWidget {
  const ShowAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    final List<String> myArr = List.from(((myUser?.avatarArr ?? []).isEmpty)
        ? [(mockString(1))]
        : myUser?.avatarArr ?? []);
    debugPrint(myArr.toString());

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
                leading: Text(
                  "My Cards",
                  style: TextStyle(
                    fontSize: 18.r,
                    color: federalBlue,
                    fontFamily: 'WendyOne',
                    letterSpacing: 0,
                  ),
                ),
                dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                trailing: Text(
                  myArr.length.toString().padLeft(2, '0'),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18.r,
                    color: federalBlue,
                  ),
                ),
              ),
            ),
          ),
          Gap(3.r),
          StaggeredGridTile.count(
            crossAxisCellCount: 20,
            mainAxisCellCount: 7.2,
            child: GridView.custom(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 7.5.w),
              gridDelegate: SliverWovenGridDelegate.count(
                crossAxisCount: 1,
                mainAxisSpacing: .15.r,
                crossAxisSpacing: .15.r,
                pattern: [const WovenGridTile(1, crossAxisRatio: 0.9)],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (_, index) => AvatarTile(myArr[index]),
                childCount: myArr.length,
              ),
            ),
          ),
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
                        dimension: 36.r,
                        child: AnimatedEmoji(
                          AnimatedEmojis.smile,
                          errorWidget: Center(
                            child: Text(
                              "😎",
                              style: TextStyle(fontSize: 30.r),
                            ),
                          ),
                        ),
                      ),
                    ),
                    WidgetSpan(child: SizedBox.square(dimension: 12.r)),
                    const TextSpan(text: "Earn a new avatar")
                  ],
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: darkPurple,
                      ),
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
              titleAlignment: ListTileTitleAlignment.center,
              subtitle: Text(
                "Share your code with your friends and receive a new bonus avatar and do the collection",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: coolGray, fontWeight: FontWeight.w300),
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
                        border: Border.all(color: vermilion, width: 0.45.r),
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
                    Expanded(
                      child: AnimatedContainer(
                        color: darkPurple, //emerald
                        alignment: Alignment.center,
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          "COPY CODE",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15.r,
                            fontWeight: FontWeight.normal,
                            color: ghostWhite,
                          ),
                        ),
                      ),
                    )
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
                  onTap: () => showDialog(
                    context: context,
                    builder: (_) => const PassAvatarDialog(),
                  ),
                  child: Text(
                    "Tap here to paste the code",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: darkPurple, fontWeight: FontWeight.normal),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          Gap(15.r),
          StaggeredGridTile.fit(
            crossAxisCellCount: 20,
            child: SizedBox(
              height: 300.h,
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

class PassAvatarDialog extends ConsumerWidget {
  const PassAvatarDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String str = List.generate(
        6,
        <String>(int index) => defaultEmojiSet[1]
            .emoji[mockInteger(0, defaultEmojiSet[1].emoji.length - 1)]
            .emoji).join();
    return AlertDialog(
      backgroundColor: ghostWhite1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      content: SizedBox(
        width: double.maxFinite,
        height: 150.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "Paste the friend's code",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                fontSize: 15.r,
              ),
              maxLines: 1,
            ),
            Gap(24.r),
            SizedBox(
              height: 60.h,
              child: TextFormField(
                maxLines: 1,
                controller: TextEditingController(text: str),
                style: TextStyle(fontSize: 21.r),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.3.r, color: federalBlue),
                      borderRadius: BorderRadius.circular(36.r),
                      gapPadding: 0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.3.r, color: richBlack),
                      borderRadius: BorderRadius.circular(36.r),
                      gapPadding: 0,
                    ),
                    contentPadding:
                        EdgeInsets.only(bottom: 0.h, left: 15.w, top: 0.h)
                    //    EdgeInsets.only(left: 15.r, right: 15.r, bottom: 15.r),
                    //isDense: true,
                    //isCollapsed: false,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AvatarTile extends ConsumerWidget {
  final String avatar;
  const AvatarTile(this.avatar, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;
    bool isMyAvatar = (myUser?.avatar ?? "") == avatar;

    return AnimatedOpacity(
      opacity: isMyAvatar ? 0.9 : 0.3,
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
                      Positioned.fill(
                        bottom: -24.r,
                        child: FadeInUp(
                          delay: const Duration(milliseconds: 300),
                          child: InkWell(
                            onTap: isMyAvatar
                                ? null
                                : () => ref
                                    .read(setAvatarProvider(avatar).future)
                                    .whenComplete(
                                      () => ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Profile Avatar is Changed",
                                          ),
                                        ),
                                      ),
                                    ),
                            child: RandomAvatar(avatar, trBackground: true),
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

class PassAvatarListTile extends ConsumerWidget {
  final PassAvatar passAvatar;
  const PassAvatarListTile(this.passAvatar, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();

    MyUser? fromUser = ref
        .watch(xUserProvider(passAvatar.from))
        .maybeWhen(orElse: () => null, data: (data) => data);

    MyUser? toUser = ref
        .watch(xUserProvider(passAvatar.to))
        .maybeWhen(orElse: () => null, data: (data) => data);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      margin: EdgeInsets.symmetric(vertical: 1.5.r),
      decoration: BoxDecoration(
        color: mockInteger(0, 9) == 9
            ? gridColor[mockInteger(0, 2)].withOpacity(1)
            : null,
        borderRadius: BorderRadius.circular(3.r),
      ),
      alignment: Alignment.center,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 4.5.r),
        leadingAndTrailingTextStyle: TextStyle(
          fontFamily: 'Montserrat',
          color: gray,
          fontSize: 12.r,
        ),
        dense: true,
        //isThreeLine: true,
        subtitleTextStyle: TextStyle(fontSize: 9.r),
        //subtitle: Text("ss"),
        horizontalTitleGap: 1.5.r,
        leading: Container(
          constraints: BoxConstraints.tight(Size(60.w, 30.h)),
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Icon(
                Icons.timer_outlined,
                size: 15.r,
                color: drabDarkBrown,
              ),
              Gap(4.5.r),
              AutoSizeText(
                // "${mockInteger(1, 12).toString().padLeft(2, '0')}: ${mockInteger(1, 59).toString().padLeft(2, '0')} PM",
                now.day == passAvatar.createdAt.day
                    ? DateFormat.Hm().format(passAvatar.createdAt)
                    : DateFormat.MMMd().format(passAvatar.createdAt),
                stepGranularity: 1.5,
                overflow: TextOverflow.ellipsis,
                minFontSize: 6,
                maxFontSize: 9,
              ),
            ],
          ),
        ),
        titleTextStyle: TextStyle(
          fontSize: 10.5.r,
          fontFamily: 'Montserrat',
          color: federalBlue,
          fontWeight: FontWeight.normal,
        ),
        title: Container(
          margin: EdgeInsets.only(bottom: 12.r),
          child: Row(
            children: [
              if (fromUser != null) ...[
                if (fromUser.avatar?.isNotEmpty ?? false) ...[
                  CircleAvatar(
                    radius: 12.r,
                    child: RandomAvatar(fromUser.avatar ?? mockString()),
                  ),
                  Gap(9.r),
                ],
                ConstrainedBox(
                  //width: 60.w,
                  constraints: BoxConstraints(maxWidth: 90.w),
                  child: AutoSizeText(
                    firstCaps(fromUser.name),
                    minFontSize: 9,
                    maxFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13.2.r),
                  ),
                ),
              ],
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18.r),
                child: const Icon(Icons.arrow_right_alt, color: gray),
              ),
              if (toUser != null) ...[
                if (toUser.avatar?.isNotEmpty ?? false) ...[
                  CircleAvatar(
                    radius: 12.r,
                    child: RandomAvatar(toUser.avatar ?? mockString()),
                  ),
                  Gap(9.r),
                ],
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 90.w),
                    child: AutoSizeText(
                      toUser.name,
                      style: TextStyle(fontSize: 13.2.r),
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 9,
                      maxFontSize: 12,
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

//Share your code with friends and unlock a special
//bonus avatar for your collection.

//Invite friends to exchange code and unlock an exclusive bonus avatar for your collection.

//"Team up with friends, share your code, and enjoy a cool new bonus avatar for your collection."
