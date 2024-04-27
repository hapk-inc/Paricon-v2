import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mock_data/mock_data.dart';

import '../values/names.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  const Player._();

  @JsonSerializable(includeIfNull: false)
  const factory Player({
    @Default("User#") String name,
    String? rName,
    num? tag,
    bool? isActive,
    String? avatar,
    String? avatarCode,
    DateTime? createdAt,
    List<String>? avatarArr,
    List<String>? friendArr,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  factory Player.fromSnapshot(DocumentSnapshot snapshot) {
    Map m = snapshot.data() as Map;

    Map<String, dynamic> json = Map<String, dynamic>.from(m);
    return Player.fromJson(json);
  }

  bool get isNotEmpty => tag != 0;

  factory Player.createOne() {
    final num x = mockInteger(100000, 999999);
    return Player(
      name: NameGen.dummyName(),
      //name: "User#$x",
      rName: "User#$x",
      tag: x,
      createdAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toDatabase(String id) => {
        ...{'id': id},
        ...{'name': name, 'tag': tag}
      };
}
