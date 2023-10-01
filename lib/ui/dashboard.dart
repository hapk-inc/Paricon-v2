import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/s_size.dart';
import '../../theme/my_color.dart';
import '../logic/remote_values.dart';
import '../my_widget/build_app_bar.dart';

@RoutePage()
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenSize sSize = ref.read(sizeProvider);
    final String inWork = ref.watch(inWorkProvider);
    return Scaffold(
      appBar: buildAppBar(sSize, context),
      backgroundColor: ghostWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(9.r),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox.square(dimension: 60.r),
                AutoSizeText(
                  inWork.isNotEmpty ? inWork : "Work in Progress",
                  wrapWords: false,
                  style: TextStyle(
                    fontSize: 60.r,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    color: cadetGray,
                  ),
                ),
                SizedBox(height: 9.r),
                Text(
                  "Appreciate your patience",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18.r,
                      fontWeight: FontWeight.w300,
                      color: gunMetal,
                      letterSpacing: .3.r),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
