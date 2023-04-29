import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/my_widgets/my_names.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../my_widgets/my_list_tile.dart';

class DashboardW extends ConsumerWidget {
  const DashboardW({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
        child: Column(
          children: [
            SizedBox(
              height: 140.h,
              //color: Colors.teal,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    6,
                    (index) => SizedBox(
                          width: 120.h,
                          //color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 6,
                                child: CircleAvatar(
                                  radius: 45.h,
                                  child: RandomAvatar(mockString()),
                                ),
                              ),
                              const Space10(),
                              Flexible(
                                flex: 2,
                                child: AutoSizeText(
                                  myRandomName(),
                                  style: const TextStyle(fontSize: 10),
                                  maxFontSize: 12,
                                  minFontSize: 9,
                                  maxLines: 1,
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: AutoSizeText(
                                  myRandomName(),
                                  style: const TextStyle(fontSize: 10),
                                  maxFontSize: 12,
                                  minFontSize: 9,
                                  maxLines: 1,
                                ),
                              )
                            ],
                          ),
                        )),
              ),
            )
          ],
        ),
      );
}
