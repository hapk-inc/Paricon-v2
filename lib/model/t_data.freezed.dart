// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 't_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TData _$TDataFromJson(Map<String, dynamic> json) {
  return _TData.fromJson(json);
}

/// @nodoc
mixin _$TData {
  String? get name => throw _privateConstructorUsedError;
  String? get tCode => throw _privateConstructorUsedError;
  int get expected => throw _privateConstructorUsedError;
  DateTime? get start => throw _privateConstructorUsedError;
  DateTime? get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TDataCopyWith<TData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TDataCopyWith<$Res> {
  factory $TDataCopyWith(TData value, $Res Function(TData) then) =
      _$TDataCopyWithImpl<$Res, TData>;
  @useResult
  $Res call(
      {String? name,
      String? tCode,
      int expected,
      DateTime? start,
      DateTime? end});
}

/// @nodoc
class _$TDataCopyWithImpl<$Res, $Val extends TData>
    implements $TDataCopyWith<$Res> {
  _$TDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? tCode = freezed,
    Object? expected = null,
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      tCode: freezed == tCode
          ? _value.tCode
          : tCode // ignore: cast_nullable_to_non_nullable
              as String?,
      expected: null == expected
          ? _value.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as int,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TDataImplCopyWith<$Res> implements $TDataCopyWith<$Res> {
  factory _$$TDataImplCopyWith(
          _$TDataImpl value, $Res Function(_$TDataImpl) then) =
      __$$TDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? tCode,
      int expected,
      DateTime? start,
      DateTime? end});
}

/// @nodoc
class __$$TDataImplCopyWithImpl<$Res>
    extends _$TDataCopyWithImpl<$Res, _$TDataImpl>
    implements _$$TDataImplCopyWith<$Res> {
  __$$TDataImplCopyWithImpl(
      _$TDataImpl _value, $Res Function(_$TDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? tCode = freezed,
    Object? expected = null,
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_$TDataImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      tCode: freezed == tCode
          ? _value.tCode
          : tCode // ignore: cast_nullable_to_non_nullable
              as String?,
      expected: null == expected
          ? _value.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as int,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TDataImpl implements _TData {
  const _$TDataImpl(
      {this.name, this.tCode, this.expected = 0, this.start, this.end});

  factory _$TDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TDataImplFromJson(json);

  @override
  final String? name;
  @override
  final String? tCode;
  @override
  @JsonKey()
  final int expected;
  @override
  final DateTime? start;
  @override
  final DateTime? end;

  @override
  String toString() {
    return 'TData(name: $name, tCode: $tCode, expected: $expected, start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tCode, tCode) || other.tCode == tCode) &&
            (identical(other.expected, expected) ||
                other.expected == expected) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, tCode, expected, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TDataImplCopyWith<_$TDataImpl> get copyWith =>
      __$$TDataImplCopyWithImpl<_$TDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TDataImplToJson(
      this,
    );
  }
}

abstract class _TData implements TData {
  const factory _TData(
      {final String? name,
      final String? tCode,
      final int expected,
      final DateTime? start,
      final DateTime? end}) = _$TDataImpl;

  factory _TData.fromJson(Map<String, dynamic> json) = _$TDataImpl.fromJson;

  @override
  String? get name;
  @override
  String? get tCode;
  @override
  int get expected;
  @override
  DateTime? get start;
  @override
  DateTime? get end;
  @override
  @JsonKey(ignore: true)
  _$$TDataImplCopyWith<_$TDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
