import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/my_user.dart';
import 'pass_avatar_notifier.dart';

final FutureProviderFamily<Map<String, MyUser>, String>
    searchAvatarCodeProvider =
    FutureProvider.family<Map<String, MyUser>, String>(
  (ref, code) async {
    final passAvatar = ref.read(passAvatarNotifierProvider);
    return passAvatar.searchAvatarCode(code);
  },
);

final updatePassAvatarProvider =
    FutureProvider.autoDispose.family<void, String>(
  (ref, id) async {
    final passAvatar = ref.read(passAvatarNotifierProvider);
    return passAvatar.updatePassAvtar(id);
  },
);

/*final firstAvatarProvider = FutureProvider.family<void, String>(
  (ref, avatar) async {
    final passAvatar = ref.read(passAvatarNotifierProvider);
    return passAvatar.firstAvatar(avatar);
  },
);*/

final AutoDisposeFutureProviderFamily getNewAvatarProvider =
    FutureProvider.family.autoDispose<void, String>(
  (ref, doc) async {
    final passAvatar = ref.read(passAvatarNotifierProvider);
    return passAvatar.getNewAvatar(doc);
  },
);

final AutoDisposeFutureProviderFamily updateFaceAvatarProvider =
    FutureProvider.family.autoDispose<void, String>(
  (ref, avatar) async {
    final passAvatar = ref.read(passAvatarNotifierProvider);
    return passAvatar.updateFaceAvatar(avatar);
  },
);
