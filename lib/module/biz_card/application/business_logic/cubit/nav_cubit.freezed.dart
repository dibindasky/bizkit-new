// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nav_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavState {
  int get slectedtabIndex => throw _privateConstructorUsedError;
  int get selectedOnBoardingScreen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavStateCopyWith<NavState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavStateCopyWith<$Res> {
  factory $NavStateCopyWith(NavState value, $Res Function(NavState) then) =
      _$NavStateCopyWithImpl<$Res, NavState>;
  @useResult
  $Res call({int slectedtabIndex, int selectedOnBoardingScreen});
}

/// @nodoc
class _$NavStateCopyWithImpl<$Res, $Val extends NavState>
    implements $NavStateCopyWith<$Res> {
  _$NavStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slectedtabIndex = null,
    Object? selectedOnBoardingScreen = null,
  }) {
    return _then(_value.copyWith(
      slectedtabIndex: null == slectedtabIndex
          ? _value.slectedtabIndex
          : slectedtabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedOnBoardingScreen: null == selectedOnBoardingScreen
          ? _value.selectedOnBoardingScreen
          : selectedOnBoardingScreen // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> implements $NavStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int slectedtabIndex, int selectedOnBoardingScreen});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NavStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slectedtabIndex = null,
    Object? selectedOnBoardingScreen = null,
  }) {
    return _then(_$InitialImpl(
      slectedtabIndex: null == slectedtabIndex
          ? _value.slectedtabIndex
          : slectedtabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedOnBoardingScreen: null == selectedOnBoardingScreen
          ? _value.selectedOnBoardingScreen
          : selectedOnBoardingScreen // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.slectedtabIndex, required this.selectedOnBoardingScreen});

  @override
  final int slectedtabIndex;
  @override
  final int selectedOnBoardingScreen;

  @override
  String toString() {
    return 'NavState(slectedtabIndex: $slectedtabIndex, selectedOnBoardingScreen: $selectedOnBoardingScreen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.slectedtabIndex, slectedtabIndex) ||
                other.slectedtabIndex == slectedtabIndex) &&
            (identical(
                    other.selectedOnBoardingScreen, selectedOnBoardingScreen) ||
                other.selectedOnBoardingScreen == selectedOnBoardingScreen));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, slectedtabIndex, selectedOnBoardingScreen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements NavState {
  const factory _Initial(
      {required final int slectedtabIndex,
      required final int selectedOnBoardingScreen}) = _$InitialImpl;

  @override
  int get slectedtabIndex;
  @override
  int get selectedOnBoardingScreen;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
