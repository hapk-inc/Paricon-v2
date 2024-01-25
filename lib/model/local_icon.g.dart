// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_icon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalIconImpl _$$LocalIconImplFromJson(Map<String, dynamic> json) =>
    _$LocalIconImpl(
      color: json['color'] as String?,
      audio: json['audio'] as String?,
      iconCode: json['iconCode'] as int,
      iconNo: json['iconNo'] as int,
      isCheck: json['isCheck'] as bool? ?? false,
      isFound: json['isFound'] as bool? ?? false,
    );

Map<String, dynamic> _$$LocalIconImplToJson(_$LocalIconImpl instance) =>
    <String, dynamic>{
      'color': instance.color,
      'audio': instance.audio,
      'iconCode': instance.iconCode,
      'iconNo': instance.iconNo,
      'isCheck': instance.isCheck,
      'isFound': instance.isFound,
    };
