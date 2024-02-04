import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../logic/my_names.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

final PanelController _panelController = PanelController();

class EnterAvatarCodeBuilder extends ConsumerStatefulWidget {
  final void Function({Object? returnValue}) action;

  const EnterAvatarCodeBuilder(this.action, {super.key});

  @override
  ConsumerState createState() => _EnterAvatarCodeBuilderState();
}

class _EnterAvatarCodeBuilderState
    extends ConsumerState<EnterAvatarCodeBuilder> {
  final tController = TextEditingController();
  final pTheme = SlidingPanelTheme();
  final List<String> _a = [];

  @override
  void initState() {
    super.initState();
    tController.addListener(
      () {
        debugPrint("77--");
        debugPrint(tController.text);
      },
    );

    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        if (!_panelController.isPanelOpen) {
          _panelController.open();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    tController.dispose();
  }

  @override
  Widget build(BuildContext context) => SlidingUpPanel(
        controller: _panelController,
        borderRadius: pTheme.slidingPanelRadius,
        panel: Container(
          decoration: BoxDecoration(
            color: tropicalIndigo,
            borderRadius: pTheme.slidingPanelRadius,
          ),
          padding: pTheme.slidingPanelPadding,
          child: Column(
            children: [
              Container(
                width: 330.w,
                padding: EdgeInsets.only(left: 1.5.w),
                child: TextFormField(
                  maxLines: 1,
                  //maxLength: 6,
                  cursorColor: chocolateCosmos,
                  cursorWidth: 1.2.r,
                  controller: tController,
                  keyboardType: TextInputType.none,
                  style: TextStyle(
                    fontSize: 24.r,
                    height: 1.8.r,
                    letterSpacing: 4.5.r,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Type the emoji to enter avatar code',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 0,
                      fontSize: 15.r,
                      color: richBlack,
                      fontWeight: FontWeight.w300,
                    ),
                    isDense: true,
                    isCollapsed: false,
                    suffixIcon: Container(
                      constraints: BoxConstraints.tight(Size.square(30.r)),
                      child: IconButton(
                        //onPressed: onSubmitted(),
                        onPressed: () {
                          if (_a.isNotEmpty) {
                            setState(() {
                              _a.removeLast();
                              tController.text =
                                  _a.map((e) => emojiArr[int.parse(e)]).join();
                            });
                          }
                        },
                        icon: Icon(
                          Icons.backspace,
                          size: 21.r,
                          color: cornellRed,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Gap(24.r),
              Expanded(
                child: GridView.custom(
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 8,
                    pattern: [
                      const WovenGridTile(1, crossAxisRatio: 0.9),
                      const WovenGridTile(1, crossAxisRatio: 0.9),
                      const WovenGridTile(1),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (_, index) => Container(
                      padding: EdgeInsets.all(4.5.r),
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Text(emojiArr[index]),
                        onTap: () {
                          setState(() => _a.add("$index"));
                          tController.text =
                              _a.map((e) => emojiArr[int.parse(e)]).join();
                        },
                      ),
                    ),
                    childCount: 8,
                  ),
                ),
              )
            ],
          ),
        ),
        maxHeight: 240.h,
        minHeight: 0,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 72.h,
                child: ListTile(
                  contentPadding: pTheme.slidingPanelPadding,
                  horizontalTitleGap: 1.5.r,
                  dense: true,
                  leading: InkWell(
                    onTap: widget.action,
                    child: Icon(Icons.close, size: 18.r),
                  ),
                  title: AutoSizeText(
                    "See what others are sharing . . .",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24.r,
                      color: federalBlue,
                      //height: 2.1.r,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
              Expanded(
                //height: 630.h,
                child: ListView(
                  //padding: pTheme.slidingPanelPadding,
                  children: List.generate(
                      15, (index) => const EnterAvatarCodeListTile()),
                ),
              ),
            ],
          ),
        ),
      );
}

/*Expanded(
              child: SlideInUp(
                child: FadeInUp(
                  child: Container(
                    //height: 210.h,
                    decoration: BoxDecoration(
                      borderRadius: pTheme.slidingPanelRadius,
                      color: ashGray,
                    ),
                    //color: federalBlue,
                    padding: pTheme.slidingPanelPadding,
                    child: ClipRRect(
                      borderRadius: pTheme.slidingPanelRadius,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 330.w,
                            padding: EdgeInsets.only(left: 1.5.w),
                            child: TextFormField(
                              maxLines: 1,
                              //maxLength: 6,
                              cursorColor: chocolateCosmos,
                              cursorWidth: 1.2.r,
                              controller: tController,
                              //textAlign: TextAlign.center,

                              //controller: controller,
                              keyboardType: TextInputType.none,

                              //onFieldSubmitted: (x) => onSubmitted(),
                              //onEditingComplete: onSubmitted(),
                              style: TextStyle(
                                fontSize: 24.r,
                                height: 1.8.r,
                                letterSpacing: 4.5.r,
                              ),

                              decoration: InputDecoration(
                                hintText: 'Type the emoji to enter avatar code',
                                hintStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0,
                                  fontSize: 15.r,
                                  color: richBlack,
                                  fontWeight: FontWeight.w300,
                                ),
                                isDense: true,
                                isCollapsed: false,
                                suffixIcon: Container(
                                  constraints:
                                      BoxConstraints.tight(Size.square(30.r)),
                                  child: IconButton(
                                    //onPressed: onSubmitted(),
                                    onPressed: () {
                                      if (_a.isNotEmpty) {
                                        List<String> b = _a.split('');
                                        b.removeLast();

                                        tController.text = b
                                            .map((e) => emojiArr[b.indexOf(e)])
                                            .join();
                                      }
                                    },
                                    icon: Icon(
                                      Icons.backspace,
                                      size: 21.r,
                                      color: cornellRed,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gap(24.r),
                          Expanded(
                            child: GridView.custom(
                              //scrollDirection: Axis.horizontal,
                              gridDelegate: SliverWovenGridDelegate.count(
                                crossAxisCount: 8,
                                //mainAxisSpacing: 1.5.r,
                                //crossAxisSpacing: 1.5.r,
                                pattern: [
                                  const WovenGridTile(1, crossAxisRatio: 0.9),
                                  const WovenGridTile(1, crossAxisRatio: 0.9),
                                  const WovenGridTile(1),
                                ],
                              ),
                              childrenDelegate: SliverChildBuilderDelegate(
                                (_, index) => Container(
                                  padding: EdgeInsets.all(4.5.r),
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    child: Text(emojiArr[index]),
                                    onTap: () {
                                      setState(() => _a += "$index");
                                      tController.text += emojiArr[index];
                                    },
                                  ),
                                ),
                                childCount: 8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )*/

class EnterAvatarCodeListTile extends ConsumerWidget {
  const EnterAvatarCodeListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 45.h,
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      margin: EdgeInsets.symmetric(vertical: 1.5.r),
      decoration: BoxDecoration(
        color: mockInteger(0, 9) == 9
            ? gridColor[mockInteger(0, 2)].withOpacity(1)
            : null,
        borderRadius: BorderRadius.circular(3.r),
      ),
      alignment: Alignment.center,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 4.5.r),
        leadingAndTrailingTextStyle: TextStyle(
          fontFamily: 'Montserrat',
          color: gray,
          fontSize: 12.r,
        ),
        dense: true,
        //isThreeLine: true,
        subtitleTextStyle: TextStyle(fontSize: 9.r),
        //subtitle: Text("ss"),
        horizontalTitleGap: 1.5.r,
        leading: Container(
          constraints: BoxConstraints.tight(Size(72.w, 30.h)),
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Icon(
                Icons.timer_outlined,
                size: 15.r,
                color: drabDarkBrown,
              ),
              Gap(4.5.r),
              AutoSizeText(
                "${mockInteger(1, 12).toString().padLeft(2, '0')}: ${mockInteger(1, 59).toString().padLeft(2, '0')} PM",
                stepGranularity: 1.5,
                overflow: TextOverflow.ellipsis,
                minFontSize: 6,
                maxFontSize: 9,
              ),
            ],
          ),
        ),
        titleTextStyle: TextStyle(
          fontSize: 10.5.r,
          fontFamily: 'Montserrat',
          color: federalBlue,
          fontWeight: FontWeight.normal,
        ),
        title: Container(
          margin: EdgeInsets.only(bottom: 12.r),
          child: Row(
            children: [
              CircleAvatar(
                radius: 12.r,
                child: RandomAvatar(mockString()),
              ),
              Gap(9.r),
              AutoSizeText(
                myRandomName(),
                minFontSize: 9,
                maxFontSize: 12,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13.2.r),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18.r),
                child: const Icon(
                  Icons.arrow_right_alt,
                  color: gray,
                ),
              ),
              CircleAvatar(
                radius: 12.r,
                child: RandomAvatar(mockString()),
              ),
              Gap(9.r),
              Expanded(
                child: AutoSizeText(
                  myRandomName(),
                  style: TextStyle(fontSize: 13.2.r),
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 9,
                  maxFontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
