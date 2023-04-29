import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/s_size.dart';
import '../my_widgets/my_logo.dart';
import 'tournament/tournament_p.dart';

@RoutePage()
class TournamentPage extends ConsumerWidget {
  const TournamentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);

    return ProviderScope(
      child: Scaffold(
        backgroundColor: Colors.deepPurple.shade100,
        //appBar: myAppBar(sSize),
        appBar: AppBar(
          toolbarHeight: 90.h,
          titleSpacing: 0,
          //leading: Container(),
          //leadingWidth: 0.w,
          elevation: 8,
          backgroundColor: Colors.deepPurpleAccent.shade700,
          title: SizedBox(width: 270.w, child: const MyLogo()),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: sSize == ScreenSize.phone
              ? const TournamentP()
              : const TournamentT(),
        ),
      ),
    );
  }
}

class TournamentT extends StatelessWidget {
  const TournamentT({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
