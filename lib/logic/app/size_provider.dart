import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../enums/enums.dart';

final StateNotifierProvider<SizeNotifier, ScreenSize> sizeProvider =
    StateNotifierProvider<SizeNotifier, ScreenSize>(
  (_) => SizeNotifier(ScreenSize.mobile),
);

class SizeNotifier extends StateNotifier<ScreenSize> {
  SizeNotifier(super.state);

  @override
  set state(ScreenSize value) => super.state = value;

  bool get isPT => state == ScreenSize.mobile || state == ScreenSize.tab;

  bool get isP => state == ScreenSize.mobile || state == ScreenSize.smallMobile;
  bool get isTab => state == ScreenSize.tab;
  bool get isPad => state == ScreenSize.iPad;
}
