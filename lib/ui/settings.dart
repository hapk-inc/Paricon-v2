import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../values/colors.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: magnolia,
      appBar: AppBar(
        toolbarHeight: 75.h,
        backgroundColor: magnolia,
        elevation: 0,
        title: const Text("Settings", style: TextStyle(color: charcoal)),
        // centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(15.r),
            Text(
              "General",
              style: textTheme.headlineMedium?.copyWith(color: charcoal),
            ),
            Gap(24.r),
            Container(
              decoration: BoxDecoration(
                color: ghostWhite,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 7.5.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Column(
                  children: List.generate(
                    3,
                    (index) => Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: magnolia1, width: 3.6.r),
                        ),
                      ),
                      child: AspectRatio(
                        aspectRatio: 6,
                        child: const GridTileBar(
                          leading: Icon(Icons.add),
                          title: Text("Account"),
                          trailing: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Gap(30.r),
            Text(
              "More Settings",
              style: textTheme.headlineMedium?.copyWith(color: charcoal),
            ),
            Gap(24.r),
            Container(
              decoration: BoxDecoration(
                color: ghostWhite,
                borderRadius: BorderRadius.circular(7.5.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 7.5.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Column(
                  children: List.generate(
                    3,
                    (index) => Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: magnolia1, width: 3.6.r),
                        ),
                      ),
                      child: AspectRatio(
                        aspectRatio: 6,
                        child: const GridTileBar(
                          leading: Icon(Icons.add),
                          title: Text("Account"),
                          trailing: Icon(Icons.add),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
