import 'package:freezed_annotation/freezed_annotation.dart';

part 't_data.freezed.dart';
part 't_data.g.dart';

@freezed
class TData with _$TData {
  const factory TData({
    String? name,
    String? tCode,
    @Default(0) int expected,
    DateTime? start,
    DateTime? end,
  }) = _TData;

  factory TData.fromJson(Map<String, dynamic> json) => _$TDataFromJson(json);
}
