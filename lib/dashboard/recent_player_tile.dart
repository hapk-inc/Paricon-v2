import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../model/user_activity.dart';
import '../logic/sql_user.dart';
import '../logic/user_provider.dart';

class RecentPlayerTile extends ConsumerStatefulWidget {
  final String id;
  final UserActivity userActivity;
  const RecentPlayerTile(this.id, this.userActivity, {super.key});

  @override
  ConsumerState createState() => _RecentPlayerTileState();
}

class _RecentPlayerTileState extends ConsumerState<RecentPlayerTile> {
  late SQUser sq;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      sq = ref.read(sqUserProvider);
      //sq.insert(widget.id, widget.userActivity);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      xUserProvider(widget.id),
      (previous, next) {
        debugPrint(next.toString());
      },
    );
    final UserActivity userActivity = widget.userActivity;
    final String subText =
        (userActivity.name?.substring(0, 2) ?? "").toUpperCase();
    //final User? user = ref.watch(authUserProvider).value;
    //final bool isMe = widget.id == (user?.uid ?? "");
    return FadeIn(
      child: Container(
        constraints: BoxConstraints(maxWidth: 75.w),
        //width: 81.w,
        margin: EdgeInsets.only(right: 3.w),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 33.r,
                child: (userActivity.avatar ?? "").isEmpty
                    ? Text(
                        subText,
                        style:
                            TextStyle(fontFamily: 'WendyOne', fontSize: 24.r),
                      )
                    : RandomAvatar(userActivity.avatar ?? ""),
              ),
              Gap(4.5.r),
              AutoSizeText(
                userActivity.name ?? "",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.r,
                  fontWeight: FontWeight.w300,
                ),
                overflow: TextOverflow.ellipsis,
                minFontSize: 9,
                maxFontSize: 10.5,
                stepGranularity: 0.3,
                maxLines: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
