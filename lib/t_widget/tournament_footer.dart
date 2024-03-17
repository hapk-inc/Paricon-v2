import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:typewritertext/typewritertext.dart';

import '../logic/tournament_database.dart';
import '../logic/tournament_listener.dart';
import '../theme/my_color.dart';

class PlayTournamentFooter extends ConsumerStatefulWidget {
  const PlayTournamentFooter({super.key});

  @override
  ConsumerState createState() => _PlayTournamentFooterState();
}

class _PlayTournamentFooterState extends ConsumerState<PlayTournamentFooter> {
  late String aText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final String initText = ref.read(tournamentTextProvider)[mockInteger(0, 7)];
    aText = initText;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      tournamentListenerNotifierProvider
          .select((value) => value.balancePercentage),
      (previous, next) {
        debugPrint("Listening BalancePercentage $next");
        //  List<LocalIcon> icons = next;
        if (previous == 0.0 && next != 0.0) {
          debugPrint("140--");

          final String repeatText =
              ref.read(repeatTextProvider)[mockInteger(0, 2)];

          setState(() => aText += repeatText);
        }
      },
    );

    return TypeWriter.text(
      aText,
      duration: const Duration(milliseconds: 30),
      maxLines: 2,
      style: TextStyle(
        fontFamily: 'WendyOne',
        color: ghostWhite1,
        fontSize: 24.r,
        height: 2.1.r,
      ),
      onChanged: (TypeWriterValue value) {
        debugPrint("172--${value.data}");
      },
    );
  }
}
