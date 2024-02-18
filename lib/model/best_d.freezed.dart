// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'best_d.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BestD _$BestDFromJson(Map<String, dynamic> json) {
  return _BestD.fromJson(json);
}

/// @nodoc
mixin _$BestD {
  DateTime get lastPlayed => throw _privateConstructorUsedError;
  Duration get bestD => throw _privateConstructorUsedError;
  Duration? get prevD => throw _privateConstructorUsedError;
  num get tCount => throw _privateConstructorUsedError;
  String get prevGame => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BestDCopyWith<BestD> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BestDCopyWith<$Res> {
  factory $BestDCopyWith(BestD value, $Res Function(BestD) then) =
      _$BestDCopyWithImpl<$Res, BestD>;
  @useResult
  $Res call(
      {DateTime lastPlayed,
      Duration bestD,
      Duration? prevD,
      num tCount,
      String prevGame});
}

/// @nodoc
class _$BestDCopyWithImpl<$Res, $Val extends BestD>
    implements $BestDCopyWith<$Res> {
  _$BestDCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastPlayed = null,
    Object? bestD = null,
    Object? prevD = freezed,
    Object? tCount = null,
    Object? prevGame = null,
  }) {
    return _then(_value.copyWith(
      lastPlayed: null == lastPlayed
          ? _value.lastPlayed
          : lastPlayed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bestD: null == bestD
          ? _value.bestD
          : bestD // ignore: cast_nullable_to_non_nullable
              as Duration,
      prevD: freezed == prevD
          ? _value.prevD
          : prevD // ignore: cast_nullable_to_non_nullable
              as Duration?,
      tCount: null == tCount
          ? _value.tCount
          : tCount // ignore: cast_nullable_to_non_nullable
              as num,
      prevGame: null == prevGame
          ? _value.prevGame
          : prevGame // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BestDImplCopyWith<$Res> implements $BestDCopyWith<$Res> {
  factory _$$BestDImplCopyWith(
          _$BestDImpl value, $Res Function(_$BestDImpl) then) =
      __$$BestDImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime lastPlayed,
      Duration bestD,
      Duration? prevD,
      num tCount,
      String prevGame});
}

/// @nodoc
class __$$BestDImplCopyWithImpl<$Res>
    extends _$BestDCopyWithImpl<$Res, _$BestDImpl>
    implements _$$BestDImplCopyWith<$Res> {
  __$$BestDImplCopyWithImpl(
      _$BestDImpl _value, $Res Function(_$BestDImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastPlayed = null,
    Object? bestD = null,
    Object? prevD = freezed,
    Object? tCount = null,
    Object? prevGame = null,
  }) {
    return _then(_$BestDImpl(
      lastPlayed: null == lastPlayed
          ? _value.lastPlayed
          : lastPlayed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bestD: null == bestD
          ? _value.bestD
          : bestD // ignore: cast_nullable_to_non_nullable
              as Duration,
      prevD: freezed == prevD
          ? _value.prevD
          : prevD // ignore: cast_nullable_to_non_nullable
              as Duration?,
      tCount: null == tCount
          ? _value.tCount
          : tCount // ignore: cast_nullable_to_non_nullable
              as num,
      prevGame: null == prevGame
          ? _value.prevGame
          : prevGame // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BestDImpl implements _BestD {
  const _$BestDImpl(
      {required this.lastPlayed,
      required this.bestD,
      this.prevD,
      this.tCount = 1,
      this.prevGame = ""});

  factory _$BestDImpl.fromJson(Map<String, dynamic> json) =>
      _$$BestDImplFromJson(json);

  @override
  final DateTime lastPlayed;
  @override
  final Duration bestD;
  @override
  final Duration? prevD;
  @override
  @JsonKey()
  final num tCount;
  @override
  @JsonKey()
  final String prevGame;

  @override
  String toString() {
    return 'BestD(lastPlayed: $lastPlayed, bestD: $bestD, prevD: $prevD, tCount: $tCount, prevGame: $prevGame)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BestDImpl &&
            (identical(other.lastPlayed, lastPlayed) ||
                other.lastPlayed == lastPlayed) &&
            (identical(other.bestD, bestD) || other.bestD == bestD) &&
            (identical(other.prevD, prevD) || other.prevD == prevD) &&
            (identical(other.tCount, tCount) || other.tCount == tCount) &&
            (identical(other.prevGame, prevGame) ||
                other.prevGame == prevGame));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lastPlayed, bestD, prevD, tCount, prevGame);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BestDImplCopyWith<_$BestDImpl> get copyWith =>
      __$$BestDImplCopyWithImpl<_$BestDImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BestDImplToJson(
      this,
    );
  }
}

abstract class _BestD implements BestD {
  const factory _BestD(
      {required final DateTime lastPlayed,
      required final Duration bestD,
      final Duration? prevD,
      final num tCount,
      final String prevGame}) = _$BestDImpl;

  factory _BestD.fromJson(Map<String, dynamic> json) = _$BestDImpl.fromJson;

  @override
  DateTime get lastPlayed;
  @override
  Duration get bestD;
  @override
  Duration? get prevD;
  @override
  num get tCount;
  @override
  String get prevGame;
  @override
  @JsonKey(ignore: true)
  _$$BestDImplCopyWith<_$BestDImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
