import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../theme/my_color.dart';

@RoutePage()
class PlayFriendPage extends StatelessWidget {
  const PlayFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: majorelleBlue,
      appBar: AppBar(
        backgroundColor: majorelleBlue,
        iconTheme: const IconThemeData(color: ghostWhite),
      ),
      body: Container(),
    );
  }
}
