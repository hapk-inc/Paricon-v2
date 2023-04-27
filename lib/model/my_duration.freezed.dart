// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_duration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyDuration _$MyDurationFromJson(Map<String, dynamic> json) {
  return _MyDuration.fromJson(json);
}

/// @nodoc
mixin _$MyDuration {
  DateTime? get lastOpened => throw _privateConstructorUsedError;
  DateTime get currentTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyDurationCopyWith<MyDuration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyDurationCopyWith<$Res> {
  factory $MyDurationCopyWith(
          MyDuration value, $Res Function(MyDuration) then) =
      _$MyDurationCopyWithImpl<$Res, MyDuration>;
  @useResult
  $Res call({DateTime? lastOpened, DateTime currentTime});
}

/// @nodoc
class _$MyDurationCopyWithImpl<$Res, $Val extends MyDuration>
    implements $MyDurationCopyWith<$Res> {
  _$MyDurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastOpened = freezed,
    Object? currentTime = null,
  }) {
    return _then(_value.copyWith(
      lastOpened: freezed == lastOpened
          ? _value.lastOpened
          : lastOpened // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currentTime: null == currentTime
          ? _value.currentTime
          : currentTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyDurationCopyWith<$Res>
    implements $MyDurationCopyWith<$Res> {
  factory _$$_MyDurationCopyWith(
          _$_MyDuration value, $Res Function(_$_MyDuration) then) =
      __$$_MyDurationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? lastOpened, DateTime currentTime});
}

/// @nodoc
class __$$_MyDurationCopyWithImpl<$Res>
    extends _$MyDurationCopyWithImpl<$Res, _$_MyDuration>
    implements _$$_MyDurationCopyWith<$Res> {
  __$$_MyDurationCopyWithImpl(
      _$_MyDuration _value, $Res Function(_$_MyDuration) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastOpened = freezed,
    Object? currentTime = null,
  }) {
    return _then(_$_MyDuration(
      lastOpened: freezed == lastOpened
          ? _value.lastOpened
          : lastOpened // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currentTime: null == currentTime
          ? _value.currentTime
          : currentTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyDuration with DiagnosticableTreeMixin implements _MyDuration {
  const _$_MyDuration({this.lastOpened, required this.currentTime});

  factory _$_MyDuration.fromJson(Map<String, dynamic> json) =>
      _$$_MyDurationFromJson(json);

  @override
  final DateTime? lastOpened;
  @override
  final DateTime currentTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyDuration(lastOpened: $lastOpened, currentTime: $currentTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyDuration'))
      ..add(DiagnosticsProperty('lastOpened', lastOpened))
      ..add(DiagnosticsProperty('currentTime', currentTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyDuration &&
            (identical(other.lastOpened, lastOpened) ||
                other.lastOpened == lastOpened) &&
            (identical(other.currentTime, currentTime) ||
                other.currentTime == currentTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lastOpened, currentTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyDurationCopyWith<_$_MyDuration> get copyWith =>
      __$$_MyDurationCopyWithImpl<_$_MyDuration>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyDurationToJson(
      this,
    );
  }
}

abstract class _MyDuration implements MyDuration {
  const factory _MyDuration(
      {final DateTime? lastOpened,
      required final DateTime currentTime}) = _$_MyDuration;

  factory _MyDuration.fromJson(Map<String, dynamic> json) =
      _$_MyDuration.fromJson;

  @override
  DateTime? get lastOpened;
  @override
  DateTime get currentTime;
  @override
  @JsonKey(ignore: true)
  _$$_MyDurationCopyWith<_$_MyDuration> get copyWith =>
      throw _privateConstructorUsedError;
}
