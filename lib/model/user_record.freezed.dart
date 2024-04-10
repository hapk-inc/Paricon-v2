// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRecord _$UserRecordFromJson(Map<String, dynamic> json) {
  return _UserRecord.fromJson(json);
}

/// @nodoc
mixin _$UserRecord {
  DateTime get lastPlayed => throw _privateConstructorUsedError;
  DateTime get recordPlayed => throw _privateConstructorUsedError;
  Duration get timeTaken => throw _privateConstructorUsedError;
  Duration get recordTimeTaken => throw _privateConstructorUsedError;
  int get mCount => throw _privateConstructorUsedError;
  @JsonKey(toJson: null, includeIfNull: false)
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRecordCopyWith<UserRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRecordCopyWith<$Res> {
  factory $UserRecordCopyWith(
          UserRecord value, $Res Function(UserRecord) then) =
      _$UserRecordCopyWithImpl<$Res, UserRecord>;
  @useResult
  $Res call(
      {DateTime lastPlayed,
      DateTime recordPlayed,
      Duration timeTaken,
      Duration recordTimeTaken,
      int mCount,
      @JsonKey(toJson: null, includeIfNull: false) String? id});
}

/// @nodoc
class _$UserRecordCopyWithImpl<$Res, $Val extends UserRecord>
    implements $UserRecordCopyWith<$Res> {
  _$UserRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastPlayed = null,
    Object? recordPlayed = null,
    Object? timeTaken = null,
    Object? recordTimeTaken = null,
    Object? mCount = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      lastPlayed: null == lastPlayed
          ? _value.lastPlayed
          : lastPlayed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      recordPlayed: null == recordPlayed
          ? _value.recordPlayed
          : recordPlayed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeTaken: null == timeTaken
          ? _value.timeTaken
          : timeTaken // ignore: cast_nullable_to_non_nullable
              as Duration,
      recordTimeTaken: null == recordTimeTaken
          ? _value.recordTimeTaken
          : recordTimeTaken // ignore: cast_nullable_to_non_nullable
              as Duration,
      mCount: null == mCount
          ? _value.mCount
          : mCount // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRecordImplCopyWith<$Res>
    implements $UserRecordCopyWith<$Res> {
  factory _$$UserRecordImplCopyWith(
          _$UserRecordImpl value, $Res Function(_$UserRecordImpl) then) =
      __$$UserRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime lastPlayed,
      DateTime recordPlayed,
      Duration timeTaken,
      Duration recordTimeTaken,
      int mCount,
      @JsonKey(toJson: null, includeIfNull: false) String? id});
}

/// @nodoc
class __$$UserRecordImplCopyWithImpl<$Res>
    extends _$UserRecordCopyWithImpl<$Res, _$UserRecordImpl>
    implements _$$UserRecordImplCopyWith<$Res> {
  __$$UserRecordImplCopyWithImpl(
      _$UserRecordImpl _value, $Res Function(_$UserRecordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastPlayed = null,
    Object? recordPlayed = null,
    Object? timeTaken = null,
    Object? recordTimeTaken = null,
    Object? mCount = null,
    Object? id = freezed,
  }) {
    return _then(_$UserRecordImpl(
      lastPlayed: null == lastPlayed
          ? _value.lastPlayed
          : lastPlayed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      recordPlayed: null == recordPlayed
          ? _value.recordPlayed
          : recordPlayed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeTaken: null == timeTaken
          ? _value.timeTaken
          : timeTaken // ignore: cast_nullable_to_non_nullable
              as Duration,
      recordTimeTaken: null == recordTimeTaken
          ? _value.recordTimeTaken
          : recordTimeTaken // ignore: cast_nullable_to_non_nullable
              as Duration,
      mCount: null == mCount
          ? _value.mCount
          : mCount // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$UserRecordImpl extends _UserRecord {
  const _$UserRecordImpl(
      {required this.lastPlayed,
      required this.recordPlayed,
      required this.timeTaken,
      required this.recordTimeTaken,
      this.mCount = 1,
      @JsonKey(toJson: null, includeIfNull: false) this.id})
      : super._();

  factory _$UserRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRecordImplFromJson(json);

  @override
  final DateTime lastPlayed;
  @override
  final DateTime recordPlayed;
  @override
  final Duration timeTaken;
  @override
  final Duration recordTimeTaken;
  @override
  @JsonKey()
  final int mCount;
  @override
  @JsonKey(toJson: null, includeIfNull: false)
  final String? id;

  @override
  String toString() {
    return 'UserRecord(lastPlayed: $lastPlayed, recordPlayed: $recordPlayed, timeTaken: $timeTaken, recordTimeTaken: $recordTimeTaken, mCount: $mCount, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRecordImpl &&
            (identical(other.lastPlayed, lastPlayed) ||
                other.lastPlayed == lastPlayed) &&
            (identical(other.recordPlayed, recordPlayed) ||
                other.recordPlayed == recordPlayed) &&
            (identical(other.timeTaken, timeTaken) ||
                other.timeTaken == timeTaken) &&
            (identical(other.recordTimeTaken, recordTimeTaken) ||
                other.recordTimeTaken == recordTimeTaken) &&
            (identical(other.mCount, mCount) || other.mCount == mCount) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lastPlayed, recordPlayed,
      timeTaken, recordTimeTaken, mCount, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRecordImplCopyWith<_$UserRecordImpl> get copyWith =>
      __$$UserRecordImplCopyWithImpl<_$UserRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRecordImplToJson(
      this,
    );
  }
}

abstract class _UserRecord extends UserRecord {
  const factory _UserRecord(
          {required final DateTime lastPlayed,
          required final DateTime recordPlayed,
          required final Duration timeTaken,
          required final Duration recordTimeTaken,
          final int mCount,
          @JsonKey(toJson: null, includeIfNull: false) final String? id}) =
      _$UserRecordImpl;
  const _UserRecord._() : super._();

  factory _UserRecord.fromJson(Map<String, dynamic> json) =
      _$UserRecordImpl.fromJson;

  @override
  DateTime get lastPlayed;
  @override
  DateTime get recordPlayed;
  @override
  Duration get timeTaken;
  @override
  Duration get recordTimeTaken;
  @override
  int get mCount;
  @override
  @JsonKey(toJson: null, includeIfNull: false)
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$UserRecordImplCopyWith<_$UserRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
