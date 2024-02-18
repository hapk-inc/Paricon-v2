import 'package:freezed_annotation/freezed_annotation.dart';

part 'best_d.freezed.dart';
part 'best_d.g.dart';

@freezed
class BestD with _$BestD {
  const factory BestD({
    required DateTime lastPlayed,
    required Duration bestD,
    Duration? prevD,
    @Default(1) num tCount,
    @Default("") String prevGame,
  }) = _BestD;

  factory BestD.fromJson(Map<String, dynamic> json) => _$BestDFromJson(json);
}
