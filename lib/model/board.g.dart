// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoardImpl _$$BoardImplFromJson(Map<String, dynamic> json) {
  Map<String, LocalPlayer> p =
      (Map<String, dynamic>.from(json['players'] as Map)).map(
    (k, e) => MapEntry(
      k,
      LocalPlayer.fromJson(
        Map<String, dynamic>.from(e as Map),
      ),
    ),
  );

  Map<String, LocalIcon> i =
      (Map<String, dynamic>.from(json['icons'] as Map)).map(
    (k, e) => MapEntry(
      k,
      LocalIcon.fromJson(
        Map<String, dynamic>.from(e as Map),
      ),
    ),
  );
  return _$BoardImpl(
    players: SplayTreeMap.from(
      p,
      (a, b) {
        return p[a]!.playerNo.compareTo(p[b]!.playerNo);
      },
    ),
    icons: SplayTreeMap.from(
      i,
      (a, b) {
        return i[a]!.iconNo.compareTo(i[b]!.iconNo);
      },
    ),
    currentID: json['currentID'] as String,
    type: json['type'] as String,
    currentIcon: json['currentIcon'] as String?,
  );
}

Map<String, dynamic> _$$BoardImplToJson(_$BoardImpl instance) =>
    <String, dynamic>{
      'players': instance.players,
      'icons': instance.icons,
      'currentID': instance.currentID,
      'type': instance.type,
      'currentIcon': instance.currentIcon,
    };
