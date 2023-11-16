import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_init.dart';

final showAppProvider = Provider<bool>(
  (ref) {
    final remoteConfig = ref.watch(remoteConfigProvider);

    final bool showApp = remoteConfig.getBool('showApp');
    return showApp;
  },
);

final Provider<String> inWorkProvider = Provider<String>(
  (ref) {
    final remoteConfig = ref.watch(remoteConfigProvider);
    final String inWork = remoteConfig.getString('inWork');
    return inWork;
  },
);

final Provider<int> recentCountProvider = Provider<int>(
  (ref) {
    final remoteConfig = ref.watch(remoteConfigProvider);
    final int recentCount = remoteConfig.getInt('recentCount');
    return recentCount;
  },
);
