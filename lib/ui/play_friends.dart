import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/my_color.dart';

@RoutePage()
class PlayFriendPage extends StatelessWidget {
  const PlayFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: majorelleBlue,
        titleSpacing: 0,
        iconTheme: IconThemeData(color: ghostWhite, size: 18.r),
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'WendyOne',
          fontSize: 24.r,
          letterSpacing: 0.3.r,
        ),
        toolbarHeight: 72.h,
        title: const AutoSizeText("Play with Friends/Family"),
      ),
      body: Container(),
    );
  }
}
