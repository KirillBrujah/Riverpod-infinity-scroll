// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FetchListWrapper<T> {
  List<T> get data => throw _privateConstructorUsedError;
  bool get canFetch => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchListWrapperCopyWith<T, FetchListWrapper<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchListWrapperCopyWith<T, $Res> {
  factory $FetchListWrapperCopyWith(
          FetchListWrapper<T> value, $Res Function(FetchListWrapper<T>) then) =
      _$FetchListWrapperCopyWithImpl<T, $Res, FetchListWrapper<T>>;
  @useResult
  $Res call({List<T> data, bool canFetch});
}

/// @nodoc
class _$FetchListWrapperCopyWithImpl<T, $Res, $Val extends FetchListWrapper<T>>
    implements $FetchListWrapperCopyWith<T, $Res> {
  _$FetchListWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? canFetch = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
      canFetch: null == canFetch
          ? _value.canFetch
          : canFetch // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListWrapperCopyWith<T, $Res>
    implements $FetchListWrapperCopyWith<T, $Res> {
  factory _$$_ListWrapperCopyWith(
          _$_ListWrapper<T> value, $Res Function(_$_ListWrapper<T>) then) =
      __$$_ListWrapperCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> data, bool canFetch});
}

/// @nodoc
class __$$_ListWrapperCopyWithImpl<T, $Res>
    extends _$FetchListWrapperCopyWithImpl<T, $Res, _$_ListWrapper<T>>
    implements _$$_ListWrapperCopyWith<T, $Res> {
  __$$_ListWrapperCopyWithImpl(
      _$_ListWrapper<T> _value, $Res Function(_$_ListWrapper<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? canFetch = null,
  }) {
    return _then(_$_ListWrapper<T>(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
      canFetch: null == canFetch
          ? _value.canFetch
          : canFetch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ListWrapper<T> implements _ListWrapper<T> {
  const _$_ListWrapper({required final List<T> data, this.canFetch = true})
      : _data = data;

  final List<T> _data;
  @override
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final bool canFetch;

  @override
  String toString() {
    return 'FetchListWrapper<$T>(data: $data, canFetch: $canFetch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListWrapper<T> &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.canFetch, canFetch) ||
                other.canFetch == canFetch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), canFetch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListWrapperCopyWith<T, _$_ListWrapper<T>> get copyWith =>
      __$$_ListWrapperCopyWithImpl<T, _$_ListWrapper<T>>(this, _$identity);
}

abstract class _ListWrapper<T> implements FetchListWrapper<T> {
  const factory _ListWrapper(
      {required final List<T> data, final bool canFetch}) = _$_ListWrapper<T>;

  @override
  List<T> get data;
  @override
  bool get canFetch;
  @override
  @JsonKey(ignore: true)
  _$$_ListWrapperCopyWith<T, _$_ListWrapper<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
