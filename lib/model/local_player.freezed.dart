// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalPlayer _$LocalPlayerFromJson(Map<String, dynamic> json) {
  return _LocalPlayer.fromJson(json);
}

/// @nodoc
mixin _$LocalPlayer {
  String get name => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  int get pts => throw _privateConstructorUsedError;
  int get playerNo => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalPlayerCopyWith<LocalPlayer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalPlayerCopyWith<$Res> {
  factory $LocalPlayerCopyWith(
          LocalPlayer value, $Res Function(LocalPlayer) then) =
      _$LocalPlayerCopyWithImpl<$Res, LocalPlayer>;
  @useResult
  $Res call(
      {String name,
      String color,
      String avatar,
      int pts,
      int playerNo,
      bool isActive});
}

/// @nodoc
class _$LocalPlayerCopyWithImpl<$Res, $Val extends LocalPlayer>
    implements $LocalPlayerCopyWith<$Res> {
  _$LocalPlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
    Object? avatar = null,
    Object? pts = null,
    Object? playerNo = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      pts: null == pts
          ? _value.pts
          : pts // ignore: cast_nullable_to_non_nullable
              as int,
      playerNo: null == playerNo
          ? _value.playerNo
          : playerNo // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalPlayerImplCopyWith<$Res>
    implements $LocalPlayerCopyWith<$Res> {
  factory _$$LocalPlayerImplCopyWith(
          _$LocalPlayerImpl value, $Res Function(_$LocalPlayerImpl) then) =
      __$$LocalPlayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String color,
      String avatar,
      int pts,
      int playerNo,
      bool isActive});
}

/// @nodoc
class __$$LocalPlayerImplCopyWithImpl<$Res>
    extends _$LocalPlayerCopyWithImpl<$Res, _$LocalPlayerImpl>
    implements _$$LocalPlayerImplCopyWith<$Res> {
  __$$LocalPlayerImplCopyWithImpl(
      _$LocalPlayerImpl _value, $Res Function(_$LocalPlayerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
    Object? avatar = null,
    Object? pts = null,
    Object? playerNo = null,
    Object? isActive = null,
  }) {
    return _then(_$LocalPlayerImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      pts: null == pts
          ? _value.pts
          : pts // ignore: cast_nullable_to_non_nullable
              as int,
      playerNo: null == playerNo
          ? _value.playerNo
          : playerNo // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalPlayerImpl extends _LocalPlayer with DiagnosticableTreeMixin {
  const _$LocalPlayerImpl(
      {required this.name,
      required this.color,
      this.avatar = "",
      this.pts = 0,
      required this.playerNo,
      this.isActive = false})
      : super._();

  factory _$LocalPlayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalPlayerImplFromJson(json);

  @override
  final String name;
  @override
  final String color;
  @override
  @JsonKey()
  final String avatar;
  @override
  @JsonKey()
  final int pts;
  @override
  final int playerNo;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalPlayer(name: $name, color: $color, avatar: $avatar, pts: $pts, playerNo: $playerNo, isActive: $isActive)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalPlayer'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('avatar', avatar))
      ..add(DiagnosticsProperty('pts', pts))
      ..add(DiagnosticsProperty('playerNo', playerNo))
      ..add(DiagnosticsProperty('isActive', isActive));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalPlayerImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.pts, pts) || other.pts == pts) &&
            (identical(other.playerNo, playerNo) ||
                other.playerNo == playerNo) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, color, avatar, pts, playerNo, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalPlayerImplCopyWith<_$LocalPlayerImpl> get copyWith =>
      __$$LocalPlayerImplCopyWithImpl<_$LocalPlayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalPlayerImplToJson(
      this,
    );
  }
}

abstract class _LocalPlayer extends LocalPlayer {
  const factory _LocalPlayer(
      {required final String name,
      required final String color,
      final String avatar,
      final int pts,
      required final int playerNo,
      final bool isActive}) = _$LocalPlayerImpl;
  const _LocalPlayer._() : super._();

  factory _LocalPlayer.fromJson(Map<String, dynamic> json) =
      _$LocalPlayerImpl.fromJson;

  @override
  String get name;
  @override
  String get color;
  @override
  String get avatar;
  @override
  int get pts;
  @override
  int get playerNo;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$LocalPlayerImplCopyWith<_$LocalPlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
