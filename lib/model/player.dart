import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mock_data/mock_data.dart';

import 'package:equatable/equatable.dart';

import '../values/names.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player extends Equatable with _$Player {
  const Player._();

  @JsonSerializable(includeIfNull: false)
  const factory Player({
    @Default("User#") String name,
    String? rName,
    num? no,
    bool? isActive,
    String? avatar,
    String? avatarCode,
    DateTime? createdAt,
    List<String>? avatarArr,
    List<String>? friendArr,

    //
    DateTime? lastOpened,
    DateTime? lastGamePlayed,
    dynamic isPlaying,
    String? appVersion,
    DateTime? nowTime,
    @Default(false) bool isEmulator,
    @JsonKey(toJson: null, includeIfNull: false) String? id,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  factory Player.fromSnapshot(DocumentSnapshot snapshot) {
    Map m = snapshot.data() as Map;

    Map<String, dynamic> json = Map<String, dynamic>.from(m);
    return Player.fromJson(json);
  }

  bool get isNotEmpty => no != 0;

  factory Player.createOne() {
    final num x = mockInteger(100000, 999999);
    return Player(
      name: NameGen.dummyName(),
      //name: "User#$x",
      rName: "User#$x",
      no: x,
      createdAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toDatabase() => {
        ...{'id': id},
        ...{
          'name': name,
          'no': no,
          'nowTime': nowTime?.toIso8601String(),
        }
      };

  @override
  // TODO: implement props
  List<Object?> get props => [no, name];
}
