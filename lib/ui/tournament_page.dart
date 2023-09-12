import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/s_size.dart';
import '../my_widgets/app_bar.dart';
import '../my_widgets/dashboard_app_bar.dart';
import '../theme/my_color.dart';
import 'tournament/tournament_p.dart';

@RoutePage()
class TournamentPage extends ConsumerWidget {
  const TournamentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);

    return Scaffold(
      backgroundColor: iris,
      appBar: buildAppBar(sSize),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: sSize == ScreenSize.phone ? const TournamentP() : TournamentP(),
      ),
    );
  }
}
