import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paricon/theme/my_color.dart';

import '../logic/s_size.dart';
import '../my_widget/build_app_bar.dart';

@RoutePage()
class TournamentPage extends ConsumerWidget {
  const TournamentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    return Scaffold(
      appBar: buildAppBar(sSize, context),
      backgroundColor: majorelleBlue,
    );
  }
}
