import 'package:freezed_annotation/freezed_annotation.dart';

import 'my_duration.dart';
import 'my_user.dart';

part 'p_user.freezed.dart';

@freezed
class PUser with _$PUser {
  const PUser._();
  const factory PUser(MyUser myUser, MyDuration myDuration) = _PUser;

  Map<String, String> get xtoJson => {
        ...myUser.toJson(),
        ...myDuration.toJson(),
      };
}
