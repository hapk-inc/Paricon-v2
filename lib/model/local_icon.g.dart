// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_icon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalIconImpl _$$LocalIconImplFromJson(Map<String, dynamic> json) =>
    _$LocalIconImpl(
      color: _$JsonConverterFromJson<int, Color>(
              json['color'], const ColorConverter().fromJson) ??
          majorelleBlue,
      audio: json['audio'] as String?,
      iconCode: json['iconCode'] as int,
      iconNo: json['iconNo'] as int,
      isCheck: json['isCheck'] as bool?,
      isFound: json['isFound'] as bool?,
    );

Map<String, dynamic> _$$LocalIconImplToJson(_$LocalIconImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'color',
      _$JsonConverterToJson<int, Color>(
          instance.color, const ColorConverter().toJson));
  writeNotNull('audio', instance.audio);
  val['iconCode'] = instance.iconCode;
  val['iconNo'] = instance.iconNo;
  writeNotNull('isCheck', instance.isCheck);
  writeNotNull('isFound', instance.isFound);
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
