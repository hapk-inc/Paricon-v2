import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_activity.freezed.dart';
part 'my_activity.g.dart';

@freezed
class MyActivity with _$MyActivity {
  const MyActivity._();

  @JsonSerializable(includeIfNull: false)
  const factory MyActivity({
    DateTime? lastOpened,
    DateTime? lastGamePlayed,
    bool? isActive,
    dynamic isPlaying,
    String? appVersion,
    required DateTime nowTime,
    @Default(false) bool isEmulator,
  }) = _MyActivity;

  factory MyActivity.fromJson(Map<String, dynamic> json) =>
      _$MyActivityFromJson(json);

  factory MyActivity.fromSnapshot(DocumentSnapshot snapshot) {
    Map m = snapshot.data() as Map;
    Map<String, dynamic> json = Map<String, dynamic>.from(m);
    return MyActivity.fromJson(json);
  }
}
