// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalPlayerImpl _$$LocalPlayerImplFromJson(Map<String, dynamic> json) =>
    _$LocalPlayerImpl(
      name: json['name'] as String,
      color: _$JsonConverterFromJson<int, Color>(
              json['color'], const ColorConverter().fromJson) ??
          majorelleBlue,
      avatar: json['avatar'] as String?,
      pts: json['pts'] as int? ?? 0,
      playerNo: json['playerNo'] as int?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$$LocalPlayerImplToJson(_$LocalPlayerImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'color',
      _$JsonConverterToJson<int, Color>(
          instance.color, const ColorConverter().toJson));
  writeNotNull('avatar', instance.avatar);
  writeNotNull('pts', instance.pts);
  writeNotNull('playerNo', instance.playerNo);
  writeNotNull('isActive', instance.isActive);
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
