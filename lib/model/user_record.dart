import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_log.dart';

part 'user_record.freezed.dart';
part 'user_record.g.dart';

@freezed
class UserRecord with _$UserRecord {
  const UserRecord._();

  @JsonSerializable(includeIfNull: false)
  const factory UserRecord({
    required DateTime lastPlayed,
    required DateTime recordPlayed,
    required Duration timeTaken,
    required Duration recordTimeTaken,
    @Default(1) int mCount,
    @JsonKey(toJson: null, includeIfNull: false) String? id,
  }) = _UserRecord;

  factory UserRecord.fromJson(Map<String, dynamic> json) =>
      _$UserRecordFromJson(json);

  factory UserRecord.fromUserLog(UserLog log) => UserRecord(
        lastPlayed: log.when,
        timeTaken: log.timeTaken,
        recordPlayed: log.when,
        recordTimeTaken: log.timeTaken,
      );

  UserRecord fromExisting(UserLog log) {
    int c = mCount + 1;
    final bool newRecord = !recordTimeTaken.compareTo(log.timeTaken).isNegative;
    return UserRecord(
        lastPlayed: log.when,
        timeTaken: log.timeTaken,
        mCount: c,
        recordTimeTaken: newRecord ? log.timeTaken : recordTimeTaken,
        recordPlayed: newRecord ? log.when : recordPlayed);
  }

  factory UserRecord.fromSnapshot(DocumentSnapshot snapshot) {
    final Map map = snapshot.data() as Map;
    final Map<String, dynamic> json = Map<String, dynamic>.from(map);
    return UserRecord.fromJson(json);
  }

  String get durationString =>
      "${timeTaken.inMinutes.toString().padLeft(2, '0')} : ${timeTaken.inSeconds % 60}";
}
