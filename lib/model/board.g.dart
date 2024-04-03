// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoardImpl _$$BoardImplFromJson(Map<String, dynamic> json) => _$BoardImpl(
      players: (json['players'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, LocalPlayer.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      icons: (json['icons'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, LocalIcon.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      currentID: json['currentID'] as String,
      type: $enumDecodeNullable(_$BoardTypeEnumMap, json['type']) ??
          BoardType.normal,
      currentIcon: json['currentIcon'] as String?,
    );

Map<String, dynamic> _$$BoardImplToJson(_$BoardImpl instance) {
  final val = <String, dynamic>{
    'players': instance.players,
    'icons': instance.icons,
    'currentID': instance.currentID,
    'type': _$BoardTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('currentIcon', instance.currentIcon);
  return val;
}

const _$BoardTypeEnumMap = {
  BoardType.normal: 'normal',
  BoardType.closed: 'closed',
  BoardType.orderwise: 'orderwise',
};
