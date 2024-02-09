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

final Provider<bool> showPlayOnlineProvider = Provider<bool>(
  (ref) {
    final remoteConfig = ref.watch(remoteConfigProvider);
    final bool show = remoteConfig.getBool('playOnline');
    return show;
  },
);

final Provider<bool> enterAvatarCodeProvider = Provider<bool>(
  (ref) {
    final remoteConfig = ref.watch(remoteConfigProvider);
    final bool enterAvatarCode = remoteConfig.getBool('enterAvatarCode');
    return enterAvatarCode;
  },
);

final Provider<int> onlinePlayerProvider = Provider<int>(
  (ref) {
    final remoteConfig = ref.watch(remoteConfigProvider);
    final int onlineCount = remoteConfig.getInt('onlineCount');
    return onlineCount == 0 ? 1 : onlineCount;
  },
);
