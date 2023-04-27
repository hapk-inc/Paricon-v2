import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../logic/auth.dart';
import '../../logic/pick_avatar.dart';
import '../../my_widgets/my_logo.dart';

final _panelController = PanelController();
final _nameController = TextEditingController();

class LoginP extends ConsumerWidget {
  const LoginP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SlidingUpPanel(
      controller: _panelController,
      minHeight: 270.h,
      maxHeight: 900.h * 0.7,
      borderRadius: BorderRadius.vertical(top: Radius.circular(18.w)),
      body: Column(
        children: [
          SizedBox(
            height: 300.h,
            width: 360.w,
            child: FadeIn(
              delay: const Duration(seconds: 2),
              child: const MyLogo(),
              controller: (p0) {
                print("------");
              },
            ),
          ),
        ],
      ),
      // onPanelSlide: (position) => print("OnPanelSlide $position"),
      panel: const LoginPanel(),
    );
  }
}

class LoginPanel extends ConsumerWidget {
  const LoginPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String pickAvatar = ref.watch(pickAvatarProvider);
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade100,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(18.w),
        ),
      ),
      child: LayoutBuilder(
        builder: (p0, p1) => Column(
          children: [
            Container(
              height: 270.h,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: LayoutBuilder(
                builder: (_, p1) => Stack(
                  children: [
                    if (!kIsWeb)
                      Positioned(
                        width: p1.maxWidth * 1,
                        height: p1.maxHeight * 0.1,
                        top: p1.maxHeight * 0.05,
                        child: FadeInRight(
                          delay: const Duration(milliseconds: 500),
                          from: 50,
                          child: const Text(
                            "Firstly, Thanks for Installing",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.deepPurple,
                              //fontWeight: FontWeight.w300,
                              fontSize: 9,
                            ),
                          ),
                        ),
                      ),
                    Positioned(
                      top: p1.maxHeight * 0.15,
                      width: p1.maxWidth * 1,
                      height: p1.maxHeight * 0.45,
                      child: FadeInRight(
                        delay: const Duration(seconds: 1),
                        from: 50,
                        child: const AutoSizeText(
                          "Invite your friends to a battle of wits.The smartest wins",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w700,
                            //fontSize: 24,
                          ),
                          maxLines: 2,
                          minFontSize: 12,
                          maxFontSize: 18,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10.h,
                      width: 300.w,
                      height: p1.maxHeight * 0.4,
                      child: FadeInRight(
                        delay: const Duration(seconds: 1),
                        child: TextFormField(
                          onTap: () {
                            //debugPrint(_panelController.isPanelOpen.toString());
                            if (!_panelController.isPanelOpen) {
                              _panelController.open();
                            }
                          },
                          enabled: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some Name Ex: ${mockName()}';
                            }
                            /*if (pickAvatar.isEmpty) {
                                  return 'Choose any avatar below';
                                }*/
                            return null;
                          },
                          controller: _nameController,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w700,
                          ),
                          decoration: InputDecoration(
                            /*errorText:
                        _nameController.text.isEmpty || _nameController.text == ""
                            ? 'Please enter some Name Ex: ${mockName()}'
                            : null,*/
                            filled: true,
                            fillColor:
                                Colors.deepPurple.shade100.withOpacity(0.25),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide:
                                  const BorderSide(color: Colors.deepPurple),
                            ),
                            labelText: 'Enter your Name',
                            /*helperText: 'Ex: ${mockName()}',
                              helperStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.h,
                              ),*/
                            labelStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18.h,
                              fontWeight: FontWeight.normal,
                              color: Colors.deepPurple.shade400,
                            ),
                            errorStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 9,
                              color: Colors.red.shade400,
                            ),
                            //icon: Icon(Icons.pin, size: 24),
                            iconColor: Colors.deepPurple,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: const BorderSide(color: Colors.green),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide:
                                  BorderSide(color: Colors.deepPurple.shade200),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: Colors.red.shade100,
                                width: .1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: .75,
                              ),
                            ),
                            enabled: true,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: p1.maxHeight * 0.125,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10.w),
              child: const AutoSizeText(
                "Pick your avatar",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                maxLines: 2,
                minFontSize: 9,
                maxFontSize: 14,
              ),
            ),
            Wrap(
              spacing: 6.w,
              runSpacing: 20.h,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.start,
              children: List.generate(4, (i) {
                final String avatar = ref.read(randomAvatarProvider)[i];

                return AnimatedOpacity(
                  //opacity: 1,
                  opacity: avatar == pickAvatar ? 1 : 0.2,
                  duration: const Duration(milliseconds: 500),
                  child: InkWell(
                    onTap: () {
                      //print("mString $mString");
                      ref.read(pickAvatarProvider.notifier).state = avatar;
                    },
                    child: CircleAvatar(
                      backgroundColor:
                          Colors.primaries[mockInteger(0, 10)].shade200,
                      radius: 40,
                      child: RandomAvatar(
                        avatar,
                        trBackground: true,
                      ),
                    ),
                  ),
                );
              }),
            ),
            Expanded(
              child: ButtonBar(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Colors.deepPurple.shade400)),
                    child: Container(
                      width: 150.w,
                      height: 45.h,
                      alignment: Alignment.center,
                      child: Text(
                        "Google Sign In",
                        style: TextStyle(
                            color: Colors.deepPurple.shade200,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        ref.read(anonymousProvider(_nameController.text)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.deepPurple.shade300),
                    ),
                    child: Container(
                      width: 150.w,
                      height: 45.h,
                      alignment: Alignment.center,
                      child: const Text(
                        "Guest Mode",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
