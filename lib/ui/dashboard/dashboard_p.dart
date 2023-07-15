import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/my_widgets/trophy_rank.dart';
import 'package:paricon/routes/my_route.dart';

import '../../my_widgets/my_list_tile.dart';
import '../../my_widgets/my_logo.dart';
import '../../my_widgets/my_names.dart';
import 'package:random_avatar/random_avatar.dart';

class DashboardP extends ConsumerStatefulWidget {
  const DashboardP({super.key});

  @override
  ConsumerState createState() => _DashboardPState();
}

class _DashboardPState extends ConsumerState<DashboardP> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 210.h,
          collapsedHeight: 100.h,
          toolbarHeight: 100.h,
          leadingWidth: 0,
          elevation: 8,
          centerTitle: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.w),
              bottomRight: Radius.circular(15.w),
            ),
          ),
          title: Container(
            width: 360.w,
            height: 100.h,
            alignment: Alignment.centerLeft,
            child: LayoutBuilder(
              builder: (_, p1) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          height: p1.maxHeight * 0.8,
                          left: -p1.maxWidth * 0.05,
                          bottom: p1.maxHeight * 0.1,
                          width: p1.maxWidth * 0.4,
                          child: CircleAvatar(
                            radius: p1.maxHeight * 0.9,
                            backgroundColor: Colors.transparent,
                            child: RandomAvatar(
                              mockString(),
                              trBackground: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 0,
                      dense: true,
                      title: Container(
                        height: p1.maxHeight * 0.375,
                        //color: Colors.red,
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          child: AutoSizeText(
                            "Hi ${myRandomName()}",
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white70, fontSize: 72,
                              //decorationThickness: 40,
                            ),
                          ),
                        ),
                      ),
                      subtitle: Container(
                        margin: EdgeInsets.only(top: 3.h),
                        height: p1.maxHeight * 0.2,
                        //color: Colors.amber,
                        alignment: Alignment.centerLeft,
                        child: const FittedBox(
                          child: AutoSizeText(
                            "Hope you had a great day",
                            style: TextStyle(
                              color: Colors.white70,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            title: LayoutBuilder(
              builder: (context, p1) {
                double aR = p1.maxHeight / p1.maxWidth;
                return Column(
                  children: [
                    const Spacer(flex: 3),
                    Flexible(
                      flex: 1,
                      child: AnimatedOpacity(
                        opacity: aR < 0.2 ? 0.1 : aR + 0.1,
                        duration: const Duration(milliseconds: 100),
                        child: const FractionallySizedBox(
                          widthFactor: 1,
                          heightFactor: 1,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: MyLogo(),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(top: 9.h, left: 6.w),
            child: Text(
              "Players",
              style: TextStyle(
                fontSize: 24.h,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 6.h)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 105.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(top: 9.h, left: 9.w),
              children: List.generate(
                10,
                (index) => AspectRatio(
                  aspectRatio: 0.925,
                  child: LayoutBuilder(
                    builder: (context, p1) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff724cf9),
                              borderRadius:
                                  BorderRadius.circular(p1.maxWidth * 0.12),
                            ),
                            padding: EdgeInsets.only(top: p1.maxHeight * 0.05),
                            child: CircleAvatar(
                              radius: p1.maxWidth * 0.375,
                              backgroundColor: const Color(0xff724cf9),
                              child: RandomAvatar(
                                mockString(),
                                trBackground: true,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Flexible(
                          child: FractionallySizedBox(
                            heightFactor: 1,
                            widthFactor: 1,
                            child: FittedBox(
                              child: AutoSizeText(
                                myRandomName(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff1f2232),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Space10(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: _DailyTournamentBoard(),
        )
        /* SliverToBoxAdapter(
          child: Container(
            //color: Colors.blue,
            padding: EdgeInsets.only(left: 9.w, top: 9.h),
            height: 150.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Flexible(
                  child: FractionallySizedBox(
                    heightFactor: 1,
                    widthFactor: 1,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        "Players",
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                //Space10(),
                Expanded(
                  flex: 3,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    children: List.generate(
                      5,
                      (index) => AspectRatio(
                        aspectRatio: 0.975,
                        child: LayoutBuilder(
                          builder: (context, p1) => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                flex: 4,
                                child: CircleAvatar(
                                  radius: p1.maxWidth * 0.375,
                                  backgroundColor: const Color(0xff724cf9),
                                  child: RandomAvatar(
                                    mockString(),
                                    trBackground: true,
                                  ),
                                ),
                              ),
                              SizedBox(height: 1.5.h),
                              Flexible(
                                child: FittedBox(
                                  child: AutoSizeText(
                                    myRandomName(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff1f2232),
                                    ),
                                  ),
                                ),
                              ),
                              //const Space10(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )*/

        // sliver items 1
        /* SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20,
              right: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.deepPurple[400],
                height: 150,
              ),
            ),
          ),
        ),*/
      ],
    );
  }
}

class _DailyTournamentBoard extends StatelessWidget {
  const _DailyTournamentBoard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(9.w),
      padding: EdgeInsets.all(6.w),
      height: 300.h,
      decoration: BoxDecoration(
        color: const Color(0xfffde8e9),
        borderRadius: BorderRadius.circular(9.w),
      ),
      child: Column(
        children: [
          Flexible(
            flex: 5,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 6.h, bottom: 6.h, right: 3.w),
                  child: const TrophyRank(),
                ),
                const Flexible(
                  flex: 6,
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        "Daily Tournament",
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xff000807),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                Expanded(
                  flex: 4,
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: 0.775,
                    child: ElevatedButton(
                      onPressed: () =>
                          context.router.push(const TournamentRoute()),
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 18.w),
                        ),
                        side: const MaterialStatePropertyAll(
                          BorderSide(
                            color: Color(0xff211A1D),
                            width: 0.3,
                          ),
                        ),
                      ),
                      child: const FittedBox(
                        child: AutoSizeText(
                          "Play Now",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                )
                /*const Spacer(),
                Flexible(
                  child: Container(
                    color: Colors.blue,
                  ),
                ),*/
              ],
            ),
          ),
          Flexible(
            flex: 4,
            child: Opacity(
              opacity: 0.1,
              child: Container(
                color: Colors.amber,
                alignment: Alignment.centerLeft,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Text("Today"),
                    Text("Today"),
                    Text("Today"),
                    Text("Today"),
                  ],
                ),
              ),
            ),
          ),
          Flexible(flex: 3, child: Container(color: Colors.orange.shade50)),
          Flexible(flex: 14, child: Container(color: Colors.pink.shade50)),
          Flexible(flex: 4, child: Container(color: Colors.blue.shade50)),
        ],
      ),
    );
  }
}
