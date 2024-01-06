// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_icon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalIcon _$LocalIconFromJson(Map<String, dynamic> json) {
  return _LocalIcon.fromJson(json);
}

/// @nodoc
mixin _$LocalIcon {
  int? get color => throw _privateConstructorUsedError;
  String? get audio => throw _privateConstructorUsedError;
  int get iconCode => throw _privateConstructorUsedError;
  int get iconNo => throw _privateConstructorUsedError;
  bool get isCheck => throw _privateConstructorUsedError;
  bool get isFound => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalIconCopyWith<LocalIcon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalIconCopyWith<$Res> {
  factory $LocalIconCopyWith(LocalIcon value, $Res Function(LocalIcon) then) =
      _$LocalIconCopyWithImpl<$Res, LocalIcon>;
  @useResult
  $Res call(
      {int? color,
      String? audio,
      int iconCode,
      int iconNo,
      bool isCheck,
      bool isFound});
}

/// @nodoc
class _$LocalIconCopyWithImpl<$Res, $Val extends LocalIcon>
    implements $LocalIconCopyWith<$Res> {
  _$LocalIconCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = freezed,
    Object? audio = freezed,
    Object? iconCode = null,
    Object? iconNo = null,
    Object? isCheck = null,
    Object? isFound = null,
  }) {
    return _then(_value.copyWith(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
      iconCode: null == iconCode
          ? _value.iconCode
          : iconCode // ignore: cast_nullable_to_non_nullable
              as int,
      iconNo: null == iconNo
          ? _value.iconNo
          : iconNo // ignore: cast_nullable_to_non_nullable
              as int,
      isCheck: null == isCheck
          ? _value.isCheck
          : isCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      isFound: null == isFound
          ? _value.isFound
          : isFound // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalIconImplCopyWith<$Res>
    implements $LocalIconCopyWith<$Res> {
  factory _$$LocalIconImplCopyWith(
          _$LocalIconImpl value, $Res Function(_$LocalIconImpl) then) =
      __$$LocalIconImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? color,
      String? audio,
      int iconCode,
      int iconNo,
      bool isCheck,
      bool isFound});
}

/// @nodoc
class __$$LocalIconImplCopyWithImpl<$Res>
    extends _$LocalIconCopyWithImpl<$Res, _$LocalIconImpl>
    implements _$$LocalIconImplCopyWith<$Res> {
  __$$LocalIconImplCopyWithImpl(
      _$LocalIconImpl _value, $Res Function(_$LocalIconImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = freezed,
    Object? audio = freezed,
    Object? iconCode = null,
    Object? iconNo = null,
    Object? isCheck = null,
    Object? isFound = null,
  }) {
    return _then(_$LocalIconImpl(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
      iconCode: null == iconCode
          ? _value.iconCode
          : iconCode // ignore: cast_nullable_to_non_nullable
              as int,
      iconNo: null == iconNo
          ? _value.iconNo
          : iconNo // ignore: cast_nullable_to_non_nullable
              as int,
      isCheck: null == isCheck
          ? _value.isCheck
          : isCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      isFound: null == isFound
          ? _value.isFound
          : isFound // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalIconImpl extends _LocalIcon with DiagnosticableTreeMixin {
  const _$LocalIconImpl(
      {this.color,
      this.audio,
      required this.iconCode,
      required this.iconNo,
      this.isCheck = false,
      this.isFound = false})
      : super._();

  factory _$LocalIconImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalIconImplFromJson(json);

  @override
  final int? color;
  @override
  final String? audio;
  @override
  final int iconCode;
  @override
  final int iconNo;
  @override
  @JsonKey()
  final bool isCheck;
  @override
  @JsonKey()
  final bool isFound;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalIcon(color: $color, audio: $audio, iconCode: $iconCode, iconNo: $iconNo, isCheck: $isCheck, isFound: $isFound)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalIcon'))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('audio', audio))
      ..add(DiagnosticsProperty('iconCode', iconCode))
      ..add(DiagnosticsProperty('iconNo', iconNo))
      ..add(DiagnosticsProperty('isCheck', isCheck))
      ..add(DiagnosticsProperty('isFound', isFound));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalIconImpl &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.iconCode, iconCode) ||
                other.iconCode == iconCode) &&
            (identical(other.iconNo, iconNo) || other.iconNo == iconNo) &&
            (identical(other.isCheck, isCheck) || other.isCheck == isCheck) &&
            (identical(other.isFound, isFound) || other.isFound == isFound));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, color, audio, iconCode, iconNo, isCheck, isFound);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalIconImplCopyWith<_$LocalIconImpl> get copyWith =>
      __$$LocalIconImplCopyWithImpl<_$LocalIconImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalIconImplToJson(
      this,
    );
  }
}

abstract class _LocalIcon extends LocalIcon {
  const factory _LocalIcon(
      {final int? color,
      final String? audio,
      required final int iconCode,
      required final int iconNo,
      final bool isCheck,
      final bool isFound}) = _$LocalIconImpl;
  const _LocalIcon._() : super._();

  factory _LocalIcon.fromJson(Map<String, dynamic> json) =
      _$LocalIconImpl.fromJson;

  @override
  int? get color;
  @override
  String? get audio;
  @override
  int get iconCode;
  @override
  int get iconNo;
  @override
  bool get isCheck;
  @override
  bool get isFound;
  @override
  @JsonKey(ignore: true)
  _$$LocalIconImplCopyWith<_$LocalIconImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
