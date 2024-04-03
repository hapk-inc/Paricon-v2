import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../enums/enums.dart';

final Provider<ScreenSize> sizeProvider = Provider<ScreenSize>(
  (_) => ScreenSize.phone,
);

class SizeNotifier {
  final ScreenSize sSize;

  SizeNotifier(this.sSize);

  bool get isPT => sSize == ScreenSize.phone || sSize == ScreenSize.tab;

  bool get isP => sSize == ScreenSize.phone;
  bool get isTab => sSize == ScreenSize.tab;
  bool get isPad => sSize == ScreenSize.iPad;
}

/*
final Provider<ScreenSizeNotifier> screenSizeNotifierProvider =
    Provider<ScreenSizeNotifier>(
  (_) => throw UnimplementedError(),
);

class ScreenSizeNotifier {
  final ScreenSize screenSize;

  ScreenSizeNotifier(this.screenSize);

  bool get isPT =>
      screenSize == ScreenSize.phone || screenSize == ScreenSize.tab;
}
*/
