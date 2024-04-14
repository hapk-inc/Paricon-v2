import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

import '../router/my_route.dart';
import '../values/colors.dart';
import '../values/names.dart';

@RoutePage()
class GameRoomPage extends ConsumerWidget {
  const GameRoomPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        //minimum: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(15.r),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
              title: Text("Host Game", style: textTheme.titleLarge),
              titleTextStyle: textTheme.titleLarge,
              subtitle: Text(
                "Choose Level and type",
                style: textTheme.bodyMedium?.copyWith(color: frenchGray),
              ),
              trailing: IconButton(
                onPressed: () => context.router.maybePop(),
                icon: const Icon(Icons.close),
                color: gray,
              ),
            ),
            Gap(15.r),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Wrap(
                spacing: 15.r,
                runSpacing: 15.r,
                children: [
                  Container(
                    width: 210.w,
                    height: 51.h,
                    decoration: BoxDecoration(
                        color: magnolia,
                        borderRadius: BorderRadius.circular(4.5.r)),
                  ),
                  Container(
                    width: 90.w,
                    height: 51.h,
                    decoration: BoxDecoration(
                        color: magnolia,
                        borderRadius: BorderRadius.circular(4.5.r)),
                  ),
                  Container(
                    width: 180.w,
                    height: 51.h,
                    decoration: BoxDecoration(
                        color: magnolia,
                        borderRadius: BorderRadius.circular(4.5.r)),
                  ),
                ],
              ),
            ),
            Gap(30.r),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Text(
                    "Invite Participants",
                    style: textTheme.headlineMedium?.copyWith(color: gray),
                  ),
                  Gap(15.r),
                  Expanded(child: Container(height: 0.24.r, color: gray))
                ],
              ),
            ),
            Gap(15.r),
            Container(height: 75.h, color: magnolia1),
            AnimatedContainer(
              height: 210.h,
              color: ghostWhite,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 15.h),
              duration: const Duration(milliseconds: 450),
              child: ListView(
                children: List.generate(
                    3,
                    (index) => AspectRatio(
                          aspectRatio: 6,
                          child: Container(
                            color: magnolia1,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 4.5.h),
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 18.r,
                                backgroundColor: violetBlue,
                              ),
                              horizontalTitleGap: 15.w,
                              title: AutoSizeText.rich(
                                TextSpan(text: NameGen.dummyName(), children: [
                                  if (index == 0)
                                    TextSpan(
                                      text: "   Host",
                                      style: textTheme.bodySmall
                                          ?.copyWith(color: emerald),
                                    ),
                                ]),
                                style: textTheme.headlineMedium
                                    ?.copyWith(color: charcoal),
                              ),
                            ),
                          ),
                        )),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: ElevatedButton(
                onPressed: () {},
                // child: const Text("Create Game"),
                child: const Text("Let's Start"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
