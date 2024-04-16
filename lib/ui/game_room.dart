import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paricon/router/my_route.dart';
import '../../values/colors.dart';

@RoutePage()
class GameRoomPage extends ConsumerStatefulWidget {
  const GameRoomPage({super.key});

  @override
  ConsumerState createState() => _GameRoomPageState();
}

class _GameRoomPageState extends ConsumerState<GameRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hookerGreen,
      appBar: AppBar(
        toolbarHeight: 60.h,
        backgroundColor: hookerGreen,
        elevation: 0,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Flexible(child: Container()),
            Flexible(
              flex: 7,
              child: FadeInUp(
                child: SlideInUp(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ghostWhite,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15.r),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              /*shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                ),*/
                              backgroundColor:
                                  MaterialStatePropertyAll(hookerGreen),
                            ),
                            onPressed: () =>
                                context.router.push(const PlayFriendRoute()),
                            child: const Text("Create Room"),
                          ),
                        )
                      ],
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
