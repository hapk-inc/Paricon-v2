import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';

import 'user_activity_database.dart';
import 'user_datastore.dart';

final AutoDisposeProvider<String> newAvatarCodeProvider =
    Provider.autoDispose<String>(
  (ref) {
    String str = List.generate(
        6,
        <String>(int index) => defaultEmojiSet[1]
            .emoji[mockInteger(0, defaultEmojiSet[1].emoji.length - 1)]
            .emoji).join();
    return str;
  },
);

final FutureProviderFamily<List<String>, String> searchAvatarCodeProvider =
    FutureProvider.family<List<String>, String>(
  (ref, code) async {
    final datastore = ref.read(userDatastoreProvider);
    return datastore.searchAvatarCode(code);
  },
);

final passNewAvatarProvider = FutureProvider.family<void, String>(
  (ref, id) async {
    final datastore = ref.read(userDatastoreProvider);
    final userDatabase = ref.read(userDatabaseProvider);

    debugPrint("33--passNewAvatarProvider");

    await Future.wait(
        [datastore.newAvatarUserId(id), userDatabase.newPassAvatar(id)]);
    ;
  },
);

final FutureProvider<List<String>> passAvatarProvider =
    FutureProvider<List<String>>(
  (ref) async {
    final datastore = ref.read(userDatastoreProvider);
    return datastore.passAvatar;
  },
);

final StreamProvider<num> strPassAvatarCountProvider = StreamProvider<num>(
  (ref) {
    final userDatabase = ref.read(userDatabaseProvider);
    return userDatabase.passAvatarCount;
  },
);

final Provider<Query> passAvatarQueryProvider = Provider<Query>(
  (ref) {
    final userDatabase = ref.read(userDatabaseProvider);
    return userDatabase.passAvatarQuery;
  },
);

final Provider<Query> myPassAvatarQueryProvider = Provider<Query>(
  (ref) {
    final userDatabase = ref.read(userDatabaseProvider);
    return userDatabase.myPassAvatarQuery;
  },
);
