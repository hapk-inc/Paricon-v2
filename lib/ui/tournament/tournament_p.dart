import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/my_widgets/my_logo.dart';
import 'package:paricon/my_widgets/tournament_grid.dart';

class TournamentP extends StatelessWidget {
  const TournamentP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TournamentP2 extends ConsumerWidget {
  const TournamentP2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 180.h,
              color: const Color(0xff724cf9),
              child: Stack(
                children: [
                  Positioned(
                    left: 8,
                    top: 20,
                    width: 20,
                    height: 20,
                    child: InkWell(
                      onTap: () => context.router.pop(),
                      child: const Icon(Icons.chevron_left),
                    ),
                  ),
                  Positioned(
                    right: 27,
                    top: 50,
                    child: Text(
                      "Daily Tournament",
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfffde8e9)),
                    ),
                  ),
                  const Positioned(
                    right: 12,
                    top: 8,
                    width: 200,
                    height: 40,
                    child: MyLogo(),
                  ),
                  /* Positioned(
                      right: 10,
                      top: 5,
                      width: 45,
                      height: 45,
                      child: RandomAvatar(mockString())),
                */
                  Positioned(
                    left: 10,
                    bottom: 10,
                    width: 150,
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 36,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 45,

                                //color: Colors.teal,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    mockInteger(80, 200).toString(),
                                    style: const TextStyle(
                                      fontFamily: 'BrunoAceSC',
                                      color: Color(0xffbc9ec1),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "Rank : ${mockInteger(1, 5)}",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xffe3bac6),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                              //TrophyRank(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        LinearProgressIndicator(minHeight: 4)
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    width: 60,
                    height: 40,
                    child: Container(
                      //color: Colors.orange,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Best Record",
                            style: TextStyle(fontSize: 9),
                          ),
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                mockInteger(100, 200).toString(),
                                style: const TextStyle(fontFamily: 'LilitaOne'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TournamentGrid(),
              ),
            ),
            Container(
              height: 70.h,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
