// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'p_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PUser {
  MyUser get myUser => throw _privateConstructorUsedError;
  MyDuration get myDuration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PUserCopyWith<PUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PUserCopyWith<$Res> {
  factory $PUserCopyWith(PUser value, $Res Function(PUser) then) =
      _$PUserCopyWithImpl<$Res, PUser>;
  @useResult
  $Res call({MyUser myUser, MyDuration myDuration});

  $MyUserCopyWith<$Res> get myUser;
  $MyDurationCopyWith<$Res> get myDuration;
}

/// @nodoc
class _$PUserCopyWithImpl<$Res, $Val extends PUser>
    implements $PUserCopyWith<$Res> {
  _$PUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myUser = null,
    Object? myDuration = null,
  }) {
    return _then(_value.copyWith(
      myUser: null == myUser
          ? _value.myUser
          : myUser // ignore: cast_nullable_to_non_nullable
              as MyUser,
      myDuration: null == myDuration
          ? _value.myDuration
          : myDuration // ignore: cast_nullable_to_non_nullable
              as MyDuration,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MyUserCopyWith<$Res> get myUser {
    return $MyUserCopyWith<$Res>(_value.myUser, (value) {
      return _then(_value.copyWith(myUser: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MyDurationCopyWith<$Res> get myDuration {
    return $MyDurationCopyWith<$Res>(_value.myDuration, (value) {
      return _then(_value.copyWith(myDuration: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PUserImplCopyWith<$Res> implements $PUserCopyWith<$Res> {
  factory _$$PUserImplCopyWith(
          _$PUserImpl value, $Res Function(_$PUserImpl) then) =
      __$$PUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MyUser myUser, MyDuration myDuration});

  @override
  $MyUserCopyWith<$Res> get myUser;
  @override
  $MyDurationCopyWith<$Res> get myDuration;
}

/// @nodoc
class __$$PUserImplCopyWithImpl<$Res>
    extends _$PUserCopyWithImpl<$Res, _$PUserImpl>
    implements _$$PUserImplCopyWith<$Res> {
  __$$PUserImplCopyWithImpl(
      _$PUserImpl _value, $Res Function(_$PUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myUser = null,
    Object? myDuration = null,
  }) {
    return _then(_$PUserImpl(
      null == myUser
          ? _value.myUser
          : myUser // ignore: cast_nullable_to_non_nullable
              as MyUser,
      null == myDuration
          ? _value.myDuration
          : myDuration // ignore: cast_nullable_to_non_nullable
              as MyDuration,
    ));
  }
}

/// @nodoc

class _$PUserImpl extends _PUser {
  const _$PUserImpl(this.myUser, this.myDuration) : super._();

  @override
  final MyUser myUser;
  @override
  final MyDuration myDuration;

  @override
  String toString() {
    return 'PUser(myUser: $myUser, myDuration: $myDuration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PUserImpl &&
            (identical(other.myUser, myUser) || other.myUser == myUser) &&
            (identical(other.myDuration, myDuration) ||
                other.myDuration == myDuration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, myUser, myDuration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PUserImplCopyWith<_$PUserImpl> get copyWith =>
      __$$PUserImplCopyWithImpl<_$PUserImpl>(this, _$identity);
}

abstract class _PUser extends PUser {
  const factory _PUser(final MyUser myUser, final MyDuration myDuration) =
      _$PUserImpl;
  const _PUser._() : super._();

  @override
  MyUser get myUser;
  @override
  MyDuration get myDuration;
  @override
  @JsonKey(ignore: true)
  _$$PUserImplCopyWith<_$PUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
