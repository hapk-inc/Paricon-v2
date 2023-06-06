import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/auth.dart';

import '../../my_widgets/my_list_tile.dart';
import '../../my_widgets/my_logo.dart';

class LoginP extends ConsumerWidget {
  const LoginP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int a = mockInteger(0, 1);
    return FadeIn(
      delay: const Duration(milliseconds: 100),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ...List.generate(2, (index) => const Color(0xff9467ff)),
              ...List.generate(6, (index) => const Color(0xff724CF9)),
              ...List.generate(2, (index) => const Color(0xff9467ff)),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              width: a == 0 ? 270.w : 300.w,
              height: 15.h,
              top: 120.h,
              left: 15.w,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: FadeInDown(
                  delay: const Duration(seconds: 2),
                  child: AutoSizeText(
                    a == 0
                        ? "Engage your mind,"
                        : "Unlock your Mind's Potential",
                    style: const TextStyle(
                      fontFamily: 'LilitaOne',
                      color: Color(0xff2b2d42),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              width: a == 0 ? 180.w : 240.w,
              height: 90.h,
              top: 150.h,
              left: 15.w,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.contain,
                child: FadeInDown(
                  delay: const Duration(seconds: 1),
                  child: AutoSizeText(
                    a == 0
                        ? "Embrace the puzzle"
                        : "Step into the Puzzle Universe",
                    style: const TextStyle(
                      fontFamily: 'LilitaOne',
                      fontWeight: FontWeight.w300,
                      color: Color(0xfffde8e9),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              width: 360.w,
              height: 180.h,
              top: 210.h,
              left: 0.w,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.fitWidth,
                child: FadeInRight(
                  delay: const Duration(seconds: 3),
                  child: const MyLogo(),
                ),
              ),
            ),
            Positioned(
              left: 24.w,
              right: 24.w,
              height: 60.h,
              bottom: 240.h,
              // bottom: 240.h,
              child: FadeIn(
                delay: const Duration(milliseconds: 3500),
                child: ElevatedButton(
                  /*onPressed: () => ref.read(gSignProvider.future).catchError(
                    (e, s) {
                      if (kDebugMode) {
                        print(e);
                      }
                      ref.read(anonymousProvider);
                    },
                  ),*/
                  onPressed: () => ref.read(anonymousProvider),
                  child: const Text("Start Game"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SignInDialog extends StatelessWidget {
  const _SignInDialog();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple.shade50,
      // width: 100,
      height: 360.h,
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: LayoutBuilder(
        builder: (p0, p1) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
              ),
              onPressed: () {},
              child: SizedBox(
                height: p1.maxHeight * 0.1,
                child: Center(
                  child: AutoSizeText.rich(
                    TextSpan(children: [
                      const TextSpan(text: "Already have a account. "),
                      TextSpan(
                          text: "Click here",
                          style: TextStyle(
                            color: Colors.deepPurple.shade50,
                            fontWeight: FontWeight.w700,
                          )),
                    ]),
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Colors.deepPurple.shade100,
                    ),
                    maxLines: 1,
                    minFontSize: 6,
                    maxFontSize: 9,
                  ),
                ),
              ),
            ),
            const Space20(),
            const Padding(
              padding: EdgeInsets.only(left: 4.0),
              child: Text(
                "OR",
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 9),
              ),
            ),
            const Space20(),
            SizedBox(
              height: p1.maxHeight * 0.2,
              child: TextFormField(
                onTap: () {},
                enabled: true,
                //validator: (value) {},
                //controller: _nameController,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: p1.maxHeight * 0.04,
                  color: Colors.deepPurple.shade700,
                  fontWeight: FontWeight.w700,
                ),
                cursorColor: Colors.deepPurple.shade200,
                decoration: InputDecoration(
                  //filled: true,
                  //fillColor: Colors.white60,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: Colors.deepPurple, width: 0.5),
                  ),
                  labelText: 'Enter your Name',

                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18.h,
                    fontWeight: FontWeight.w100,
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
                    borderSide: BorderSide(color: Colors.deepPurple.shade100),
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
            const Space10(),
            /*ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const AutoSizeText(
                    "GOOGLE SIGN-IN",
                    style: TextStyle(color: Colors.deepPurple),
                    maxFontSize: 12,
                    minFontSize: 6,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const AutoSizeText(
                    "CREATE A GUEST ACCOUNT",
                    style: TextStyle(color: Colors.deepPurple),
                    maxLines: 1,
                    maxFontSize: 12,
                    minFontSize: 6,
                  ),
                ),
              ],
            )*/
          ],
        ),
      ),
    );
  }
}
