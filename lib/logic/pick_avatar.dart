import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_data/mock_data.dart';

final pickAvatarProvider = StateNotifierProvider<PickAvatar, String>(
  (_) => PickAvatar(),
);

class PickAvatar extends StateNotifier<String> {
  PickAvatar() : super("");
}

final randomAvatarProvider =
    Provider<List<String>>((_) => List.generate(5, (_) => mockString(8)));
