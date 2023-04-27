import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ScreenSize { phone, tab, pc, tv, tooSmall }

final sizeProvider = Provider<ScreenSize>(
  (_) => ScreenSize.phone,
);
