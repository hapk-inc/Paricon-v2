import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';

import '../../logic/s_size.dart';

class NameDOB extends ConsumerWidget {
  final num hintSize;

  const NameDOB({this.hintSize = 13.5, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sSize = ref.read(sizeProvider);
    final bool isPhone = sSize == ScreenSize.phone;
    final bool isPad = sSize == ScreenSize.iPad;
    return Shortcuts(
      shortcuts: const <ShortcutActivator, Intent>{
        // Pressing space in the field will now move to the next field.
        SingleActivator(LogicalKeyboardKey.enter): NextFocusIntent(),
      },
      child: FocusTraversalGroup(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {
            Form.of(primaryFocus!.context!).save();
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                2,
                (int index) {
                  return FadeInRight(
                    delay: Duration(milliseconds: (index + 1) * 100),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(
                          isPad ? 225.w : 300.w,
                          isPad
                              ? 72.h
                              : isPhone
                                  ? 60.h
                                  : 72.h)),
                      child: TextFormField(
                        onSaved: (String? value) {
                          debugPrint(
                              'Value for field $index saved as "$value"');
                        },
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: index == 0 ? 18.w : 15.w,
                          shadows: const <Shadow>[
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 4.5.w),
                          hintText:
                              index == 0 ? "Name" : "Your Birthday (optional)",
                          suffixText:
                              index == 0 ? "Ex: ${mockName()}" : "DD-MM-YYYY",
                          suffixStyle: TextStyle(
                            fontSize: 12.w,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Cabin',
                            color: Colors.grey,
                          ),
                          hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: (hintSize).w,
                            fontWeight: FontWeight.w300,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.5.h),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
