// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserLog _$UserLogFromJson(Map<String, dynamic> json) {
  return _UserLog.fromJson(json);
}

/// @nodoc
mixin _$UserLog {
  String get id => throw _privateConstructorUsedError;
  DateTime get when => throw _privateConstructorUsedError;
  Duration get timeTaken => throw _privateConstructorUsedError;
  String? get tournament => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLogCopyWith<UserLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLogCopyWith<$Res> {
  factory $UserLogCopyWith(UserLog value, $Res Function(UserLog) then) =
      _$UserLogCopyWithImpl<$Res, UserLog>;
  @useResult
  $Res call({String id, DateTime when, Duration timeTaken, String? tournament});
}

/// @nodoc
class _$UserLogCopyWithImpl<$Res, $Val extends UserLog>
    implements $UserLogCopyWith<$Res> {
  _$UserLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? when = null,
    Object? timeTaken = null,
    Object? tournament = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      when: null == when
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeTaken: null == timeTaken
          ? _value.timeTaken
          : timeTaken // ignore: cast_nullable_to_non_nullable
              as Duration,
      tournament: freezed == tournament
          ? _value.tournament
          : tournament // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserLogImplCopyWith<$Res> implements $UserLogCopyWith<$Res> {
  factory _$$UserLogImplCopyWith(
          _$UserLogImpl value, $Res Function(_$UserLogImpl) then) =
      __$$UserLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, DateTime when, Duration timeTaken, String? tournament});
}

/// @nodoc
class __$$UserLogImplCopyWithImpl<$Res>
    extends _$UserLogCopyWithImpl<$Res, _$UserLogImpl>
    implements _$$UserLogImplCopyWith<$Res> {
  __$$UserLogImplCopyWithImpl(
      _$UserLogImpl _value, $Res Function(_$UserLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? when = null,
    Object? timeTaken = null,
    Object? tournament = freezed,
  }) {
    return _then(_$UserLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      when: null == when
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeTaken: null == timeTaken
          ? _value.timeTaken
          : timeTaken // ignore: cast_nullable_to_non_nullable
              as Duration,
      tournament: freezed == tournament
          ? _value.tournament
          : tournament // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$UserLogImpl implements _UserLog {
  const _$UserLogImpl(
      {required this.id,
      required this.when,
      required this.timeTaken,
      this.tournament});

  factory _$UserLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLogImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime when;
  @override
  final Duration timeTaken;
  @override
  final String? tournament;

  @override
  String toString() {
    return 'UserLog(id: $id, when: $when, timeTaken: $timeTaken, tournament: $tournament)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.when, when) || other.when == when) &&
            (identical(other.timeTaken, timeTaken) ||
                other.timeTaken == timeTaken) &&
            (identical(other.tournament, tournament) ||
                other.tournament == tournament));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, when, timeTaken, tournament);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLogImplCopyWith<_$UserLogImpl> get copyWith =>
      __$$UserLogImplCopyWithImpl<_$UserLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLogImplToJson(
      this,
    );
  }
}

abstract class _UserLog implements UserLog {
  const factory _UserLog(
      {required final String id,
      required final DateTime when,
      required final Duration timeTaken,
      final String? tournament}) = _$UserLogImpl;

  factory _UserLog.fromJson(Map<String, dynamic> json) = _$UserLogImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get when;
  @override
  Duration get timeTaken;
  @override
  String? get tournament;
  @override
  @JsonKey(ignore: true)
  _$$UserLogImplCopyWith<_$UserLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
