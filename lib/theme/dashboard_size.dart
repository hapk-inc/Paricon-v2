import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/s_size.dart';

class DashboardSize {
  final ScreenSize screenSize;

  DashboardSize(this.screenSize);

  double get headerGap {
    switch (screenSize) {
      case ScreenSize.phone:
        return 15.r;
      case ScreenSize.tab:
        return 9.r;
      case ScreenSize.iPad:
        return 9.r;
      default:
        return 15.r;
    }
  }

  double get recentPlayerHeight {
    switch (screenSize) {
      case ScreenSize.phone:
        return 105.h;
      case ScreenSize.tab:
        return 105.h;
      default:
        return 105.h;
    }
  }

  double get enterTournamentHeight {
    switch (screenSize) {
      case ScreenSize.phone:
        return 48.h;
      case ScreenSize.tab:
        return 51.h;
      default:
        return 48.h;
    }
  }

  double get enterTournamentWidth {
    switch (screenSize) {
      case ScreenSize.phone:
        return 225.w;
      case ScreenSize.tab:
        return 234.w;
      case ScreenSize.iPad:
        return 218.w;
      default:
        return 225.w;
    }
  }

  double get enterTournamentFontSize {
    switch (screenSize) {
      case ScreenSize.phone:
        return 15.r;
      case ScreenSize.tab:
        return 16.5.r;
      default:
        return 15.r;
    }
  }

  double get openChallengeTableHeight {
    switch (screenSize) {
      case ScreenSize.phone:
        return 315.h;
      case ScreenSize.tab:
        return 330.h;
      default:
        return 330.h;
    }
  }

  double get openChallengeDataHeight {
    switch (screenSize) {
      case ScreenSize.phone:
        return 54.h;
      case ScreenSize.tab:
        return 57.h;
      default:
        return 54.h;
    }
  }

  //13.5.r

  double get openChallengeNameTextSize {
    switch (screenSize) {
      case ScreenSize.phone:
        return 13.5.r;
      case ScreenSize.tab:
        return 13.5.r;
      default:
        return 13.5.r;
    }
  }

  double get openChallengeTDurationFontSize {
    switch (screenSize) {
      case ScreenSize.phone:
        return 15;
      case ScreenSize.tab:
        return 13.5;
      default:
        return 15;
    }
  }

  double get openChallengeTDurationFontSizeSub {
    switch (screenSize) {
      case ScreenSize.phone:
        return 10.8;
      case ScreenSize.tab:
        return 10.5;
      default:
        return 10.8;
    }
  }
}
