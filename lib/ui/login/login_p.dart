import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_data/mock_data.dart';
import 'package:paricon/logic/auth.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../my_widgets/my_list_tile.dart';
import '../../my_widgets/my_logo.dart';

class LoginP extends ConsumerWidget {
  const LoginP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FadeIn(
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple.shade700,
              Colors.deepPurple.shade700,
              Colors.deepPurple.shade600,
              Colors.deepPurple.shade300,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 90.h,
              height: 240.h,
              width: 360.w,
              child: LayoutBuilder(
                builder: (_, p1) => ListTile(
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 0,
                  title: SizedBox(
                    height: p1.maxHeight * 0.5,
                    child: FadeInRight(
                      delay: const Duration(seconds: 2),
                      child: const MyLogo(),
                    ),
                  ),
                  subtitle: Container(
                    height: p1.maxHeight * 0.5,
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.symmetric(horizontal: p1.maxWidth * 0.075),
                    child: FadeIn(
                      delay: const Duration(seconds: 3),
                      child: AutoSizeText.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "Gather your wit and "
                                  "join me in a friendly competition to"
                                  " determine who among us is the ",
                            ),
                            TextSpan(
                              text: "sharpest.",
                              style: TextStyle(
                                  color: Colors.deepPurple.shade50,
                                  fontSize: 14),
                            )
                          ],
                        ),
                        style: TextStyle(
                          color: Colors.deepPurple.shade300,
                          fontWeight: FontWeight.w100,
                        ),
                        maxFontSize: 14,
                        minFontSize: 12,
                        maxLines: 4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              width: 180.w,
              left: 15.w,
              height: 60.h,
              bottom: 240.h,
              child: FadeIn(
                delay: const Duration(milliseconds: 3500),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.deepPurple.shade700),
                  ),
                  onPressed: () => ref.read(anonymousProvider("")),
                  /*onPressed: () => showModal(
                    context: context,
                    builder: (context) => const Dialog(
                      elevation: 4,
                      child: _SignInDialog(),
                    ),
                  ),*/
                  child: const AutoSizeText(
                    "Start Game",
                    style: TextStyle(fontWeight: FontWeight.w700),
                    maxLines: 1,
                    minFontSize: 9,
                    maxFontSize: 18,
                  ),
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
  const _SignInDialog({super.key});

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
                validator: (value) {},
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
