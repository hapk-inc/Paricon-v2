// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoardImpl _$$BoardImplFromJson(Map<String, dynamic> json) => _$BoardImpl(
      players: json['players'] == null
          ? const {}
          : const LocalPlayerConverter().fromJson(json['players'] as Map),
      icons: json['icons'] == null
          ? const {}
          : const LocalIconConverter().fromJson(json['icons'] as Map),
      currentID: json['currentID'] as String?,
      type: $enumDecodeNullable(_$BoardTypeEnumMap, json['type']) ??
          BoardType.normal,
      currentIcon: json['currentIcon'] as String?,
    );

Map<String, dynamic> _$$BoardImplToJson(_$BoardImpl instance) {
  final val = <String, dynamic>{
    'players': const LocalPlayerConverter().toJson(instance.players),
    'icons': const LocalIconConverter().toJson(instance.icons),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('currentID', instance.currentID);
  val['type'] = _$BoardTypeEnumMap[instance.type]!;
  writeNotNull('currentIcon', instance.currentIcon);
  return val;
}

const _$BoardTypeEnumMap = {
  BoardType.normal: 'normal',
  BoardType.closed: 'closed',
};
