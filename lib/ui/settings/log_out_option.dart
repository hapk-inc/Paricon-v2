import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:paricon/ui/settings/deactivate_account_dialog.dart';

import '../../logic/auth/bloc.dart';
import '../../values/colors.dart';
import 'log_out_dialog.dart';

class LogoutOption extends ConsumerWidget {
  const LogoutOption({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StaggeredGridTile.fit(
      crossAxisCellCount: 15,
      child: Container(
        //height: 45.h,
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        padding: EdgeInsets.only(left: 15.w),
        decoration: BoxDecoration(
          //color: lavender,
          borderRadius: BorderRadius.circular(7.5.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7.5.r),
          child: ButtonBar(
            buttonPadding: EdgeInsets.zero,
            alignment: MainAxisAlignment.spaceBetween,
            //overflowButtonSpacing: 0,
            children: [
              TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => const LogOutDialog(),
                ),
                child: const Text("LOG OUT"),
              ),
              TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => const DeactivateAccountDialog(),
                ),
                child: const Text(
                  "DELETE MY ACCOUNT",
                  style: TextStyle(color: cornellRed),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
