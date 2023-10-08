// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyUser _$MyUserFromJson(Map<String, dynamic> json) {
  return _MyUser.fromJson(json);
}

/// @nodoc
mixin _$MyUser {
  String get name => throw _privateConstructorUsedError;
  String get rName => throw _privateConstructorUsedError;
  num get id => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String? get playing => throw _privateConstructorUsedError;
  bool get isHuman => throw _privateConstructorUsedError;
  num? get controllerCount => throw _privateConstructorUsedError;
  List<String>? get controlledBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyUserCopyWith<MyUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyUserCopyWith<$Res> {
  factory $MyUserCopyWith(MyUser value, $Res Function(MyUser) then) =
      _$MyUserCopyWithImpl<$Res, MyUser>;
  @useResult
  $Res call(
      {String name,
      String rName,
      num id,
      String avatar,
      bool isActive,
      String? playing,
      bool isHuman,
      num? controllerCount,
      List<String>? controlledBy});
}

/// @nodoc
class _$MyUserCopyWithImpl<$Res, $Val extends MyUser>
    implements $MyUserCopyWith<$Res> {
  _$MyUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? rName = null,
    Object? id = null,
    Object? avatar = null,
    Object? isActive = null,
    Object? playing = freezed,
    Object? isHuman = null,
    Object? controllerCount = freezed,
    Object? controlledBy = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rName: null == rName
          ? _value.rName
          : rName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      playing: freezed == playing
          ? _value.playing
          : playing // ignore: cast_nullable_to_non_nullable
              as String?,
      isHuman: null == isHuman
          ? _value.isHuman
          : isHuman // ignore: cast_nullable_to_non_nullable
              as bool,
      controllerCount: freezed == controllerCount
          ? _value.controllerCount
          : controllerCount // ignore: cast_nullable_to_non_nullable
              as num?,
      controlledBy: freezed == controlledBy
          ? _value.controlledBy
          : controlledBy // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyUserImplCopyWith<$Res> implements $MyUserCopyWith<$Res> {
  factory _$$MyUserImplCopyWith(
          _$MyUserImpl value, $Res Function(_$MyUserImpl) then) =
      __$$MyUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String rName,
      num id,
      String avatar,
      bool isActive,
      String? playing,
      bool isHuman,
      num? controllerCount,
      List<String>? controlledBy});
}

/// @nodoc
class __$$MyUserImplCopyWithImpl<$Res>
    extends _$MyUserCopyWithImpl<$Res, _$MyUserImpl>
    implements _$$MyUserImplCopyWith<$Res> {
  __$$MyUserImplCopyWithImpl(
      _$MyUserImpl _value, $Res Function(_$MyUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? rName = null,
    Object? id = null,
    Object? avatar = null,
    Object? isActive = null,
    Object? playing = freezed,
    Object? isHuman = null,
    Object? controllerCount = freezed,
    Object? controlledBy = freezed,
  }) {
    return _then(_$MyUserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rName: null == rName
          ? _value.rName
          : rName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      playing: freezed == playing
          ? _value.playing
          : playing // ignore: cast_nullable_to_non_nullable
              as String?,
      isHuman: null == isHuman
          ? _value.isHuman
          : isHuman // ignore: cast_nullable_to_non_nullable
              as bool,
      controllerCount: freezed == controllerCount
          ? _value.controllerCount
          : controllerCount // ignore: cast_nullable_to_non_nullable
              as num?,
      controlledBy: freezed == controlledBy
          ? _value._controlledBy
          : controlledBy // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyUserImpl with DiagnosticableTreeMixin implements _MyUser {
  const _$MyUserImpl(
      {required this.name,
      this.rName = "",
      required this.id,
      required this.avatar,
      required this.isActive,
      this.playing,
      required this.isHuman,
      this.controllerCount,
      final List<String>? controlledBy})
      : _controlledBy = controlledBy;

  factory _$MyUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyUserImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey()
  final String rName;
  @override
  final num id;
  @override
  final String avatar;
  @override
  final bool isActive;
  @override
  final String? playing;
  @override
  final bool isHuman;
  @override
  final num? controllerCount;
  final List<String>? _controlledBy;
  @override
  List<String>? get controlledBy {
    final value = _controlledBy;
    if (value == null) return null;
    if (_controlledBy is EqualUnmodifiableListView) return _controlledBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyUser(name: $name, rName: $rName, id: $id, avatar: $avatar, isActive: $isActive, playing: $playing, isHuman: $isHuman, controllerCount: $controllerCount, controlledBy: $controlledBy)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyUser'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('rName', rName))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('avatar', avatar))
      ..add(DiagnosticsProperty('isActive', isActive))
      ..add(DiagnosticsProperty('playing', playing))
      ..add(DiagnosticsProperty('isHuman', isHuman))
      ..add(DiagnosticsProperty('controllerCount', controllerCount))
      ..add(DiagnosticsProperty('controlledBy', controlledBy));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyUserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rName, rName) || other.rName == rName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.playing, playing) || other.playing == playing) &&
            (identical(other.isHuman, isHuman) || other.isHuman == isHuman) &&
            (identical(other.controllerCount, controllerCount) ||
                other.controllerCount == controllerCount) &&
            const DeepCollectionEquality()
                .equals(other._controlledBy, _controlledBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      rName,
      id,
      avatar,
      isActive,
      playing,
      isHuman,
      controllerCount,
      const DeepCollectionEquality().hash(_controlledBy));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyUserImplCopyWith<_$MyUserImpl> get copyWith =>
      __$$MyUserImplCopyWithImpl<_$MyUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyUserImplToJson(
      this,
    );
  }
}

abstract class _MyUser implements MyUser {
  const factory _MyUser(
      {required final String name,
      final String rName,
      required final num id,
      required final String avatar,
      required final bool isActive,
      final String? playing,
      required final bool isHuman,
      final num? controllerCount,
      final List<String>? controlledBy}) = _$MyUserImpl;

  factory _MyUser.fromJson(Map<String, dynamic> json) = _$MyUserImpl.fromJson;

  @override
  String get name;
  @override
  String get rName;
  @override
  num get id;
  @override
  String get avatar;
  @override
  bool get isActive;
  @override
  String? get playing;
  @override
  bool get isHuman;
  @override
  num? get controllerCount;
  @override
  List<String>? get controlledBy;
  @override
  @JsonKey(ignore: true)
  _$$MyUserImplCopyWith<_$MyUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
