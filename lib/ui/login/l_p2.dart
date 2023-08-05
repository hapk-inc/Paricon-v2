import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:introduction_screen/introduction_screen.dart';

class LoginP extends StatelessWidget {
  const LoginP({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff724cf9),
            Color(0xff9467FF),
            Color(0xffB584FF),
            Color(0xffD6A1FF),
          ],
        ),
      ),
      /*    child: IntroductionScreen(
        pages: [
          introPageModel(),
          PageViewModel(
            title: "Title of custom body page",
            decoration: const PageDecoration(
              pageColor: Colors.blue,
            ),
            bodyWidget: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Click on "),
                Icon(Icons.edit),
                Text(" to edit a post"),
              ],
            ),
            image: const Center(child: Icon(Icons.android)),
          ),
        ],
        dotsDecorator: DotsDecorator(
          size: const Size.square(40.0),
          activeSize: const Size(120.0, 45.0),
          activeColor: Theme.of(context).colorScheme.secondary,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 10.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
        globalBackgroundColor: Colors.transparent,
        showSkipButton: false,
        customProgress: Container(),
        showNextButton: false,
        skip: const Text("Skip"),
        done: const Text("Done"),
        dotsFlex: 1,
        onDone: () {
          // On button pressed
        },
      ),*/
    );
  }

  /* PageViewModel introPageModel() => PageViewModel(
        bodyWidget: Container(
          height: 135.h,
          //color: Colors.teal,
          alignment: Alignment.center,
          //padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 2,
                child: Text(
                  "Engage and Unlock your Mind's Potential",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 21.sp,
                    //color: const Color(0xff2a2a72),
                    //color: const Color(0xffffa400),
                    color: const Color(0xffEFF2C0),
                    fontFamily: 'Montserrat',
                    height: 1.8,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              //SizedBox(height: 3.h),
              Flexible(
                child: Text(
                  "Step into the Puzzle Universe",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'Cabin',
                    //color: const Color(0xffF5F9E9),
                    // color: const Color(0xffFFA400),
                    //color: const Color(0xffdddddf),
                    //color: const Color(0xffBEA57D),
                    color: const Color(0xff080F0F),
                    height: 1.h,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        titleWidget: SizedBox(
          //color: Colors.indigo,
          width: 360.w,
          height: 150.h,
          //color: Colors.cyanAccent,
          child: const MyLogo(),
        ),
        footer: Container(
          margin: EdgeInsets.symmetric(horizontal: 9.w),
          child: Column(
            children: [
              */ /* Container(
                height: 24.h,
                margin: EdgeInsets.only(bottom: 30.h),
                color: Colors.amber,
                child: DotsIndicator(
                  dotsCount: 2,
                ),
              ),*/ /*
              const Spacer(),
              Expanded(
                child: SizedBox(
                  width: 360.w,
                  //color: Colors.cyanAccent,
                  child: Column(
                    children: [
                      const Spacer(),
                      SizedBox(
                        height: 54.h,
                        width: 315.w,
                        child: Consumer(
                          builder: (__, ref, _) => ElevatedButton(
                            onPressed: () =>
                                ref.read(gSignProvider.future).catchError(
                              (e, s) {
                                if (kDebugMode) {
                                  print(e);
                                }
                                ref.read(anonymousProvider);
                              },
                            ),
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9.sp),
                                ),
                              ),
                              backgroundColor: const MaterialStatePropertyAll(
                                Color(0xff232528),
                              ),
                            ),
                            child: Text(
                              "Getting Started",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontFamily: 'Cabin',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff232528),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          InkWell(
                            onTap: () {
                              print("Log In");
                            },
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                fontFamily: 'Cabin',
                                fontWeight: FontWeight.w900,
                                color: Color(0xffA52422),
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        decoration: PageDecoration(
          bodyTextStyle: TextStyle(
            fontSize: 21.sp,
            fontFamily: 'Montserrat',
            height: 1.h,
            fontWeight: FontWeight.w900,
          ),
          footerFlex: 4,
          bodyFlex: 4,
          titlePadding: EdgeInsets.zero,
          footerPadding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
          bodyPadding: EdgeInsets.symmetric(horizontal: 15.w),
        ),
      );*/
}
