// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deals_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DealModel _$DealModelFromJson(Map<String, dynamic> json) {
  return _DealModel.fromJson(json);
}

/// @nodoc
mixin _$DealModel {
  String get dealID => throw _privateConstructorUsedError;
  String get internalName => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromString)
  double get salePrice => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromString)
  double get normalPrice => throw _privateConstructorUsedError;
  String? get thumb => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DealModelCopyWith<DealModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DealModelCopyWith<$Res> {
  factory $DealModelCopyWith(DealModel value, $Res Function(DealModel) then) =
      _$DealModelCopyWithImpl<$Res, DealModel>;
  @useResult
  $Res call(
      {String dealID,
      String internalName,
      String title,
      @JsonKey(fromJson: _doubleFromString) double salePrice,
      @JsonKey(fromJson: _doubleFromString) double normalPrice,
      String? thumb});
}

/// @nodoc
class _$DealModelCopyWithImpl<$Res, $Val extends DealModel>
    implements $DealModelCopyWith<$Res> {
  _$DealModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dealID = null,
    Object? internalName = null,
    Object? title = null,
    Object? salePrice = null,
    Object? normalPrice = null,
    Object? thumb = freezed,
  }) {
    return _then(_value.copyWith(
      dealID: null == dealID
          ? _value.dealID
          : dealID // ignore: cast_nullable_to_non_nullable
              as String,
      internalName: null == internalName
          ? _value.internalName
          : internalName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      salePrice: null == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
      normalPrice: null == normalPrice
          ? _value.normalPrice
          : normalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      thumb: freezed == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DealModelCopyWith<$Res> implements $DealModelCopyWith<$Res> {
  factory _$$_DealModelCopyWith(
          _$_DealModel value, $Res Function(_$_DealModel) then) =
      __$$_DealModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dealID,
      String internalName,
      String title,
      @JsonKey(fromJson: _doubleFromString) double salePrice,
      @JsonKey(fromJson: _doubleFromString) double normalPrice,
      String? thumb});
}

/// @nodoc
class __$$_DealModelCopyWithImpl<$Res>
    extends _$DealModelCopyWithImpl<$Res, _$_DealModel>
    implements _$$_DealModelCopyWith<$Res> {
  __$$_DealModelCopyWithImpl(
      _$_DealModel _value, $Res Function(_$_DealModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dealID = null,
    Object? internalName = null,
    Object? title = null,
    Object? salePrice = null,
    Object? normalPrice = null,
    Object? thumb = freezed,
  }) {
    return _then(_$_DealModel(
      dealID: null == dealID
          ? _value.dealID
          : dealID // ignore: cast_nullable_to_non_nullable
              as String,
      internalName: null == internalName
          ? _value.internalName
          : internalName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      salePrice: null == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
      normalPrice: null == normalPrice
          ? _value.normalPrice
          : normalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      thumb: freezed == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DealModel extends _DealModel {
  const _$_DealModel(
      {required this.dealID,
      this.internalName = "",
      this.title = "",
      @JsonKey(fromJson: _doubleFromString) required this.salePrice,
      @JsonKey(fromJson: _doubleFromString) required this.normalPrice,
      this.thumb})
      : super._();

  factory _$_DealModel.fromJson(Map<String, dynamic> json) =>
      _$$_DealModelFromJson(json);

  @override
  final String dealID;
  @override
  @JsonKey()
  final String internalName;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey(fromJson: _doubleFromString)
  final double salePrice;
  @override
  @JsonKey(fromJson: _doubleFromString)
  final double normalPrice;
  @override
  final String? thumb;

  @override
  String toString() {
    return 'DealModel(dealID: $dealID, internalName: $internalName, title: $title, salePrice: $salePrice, normalPrice: $normalPrice, thumb: $thumb)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DealModel &&
            (identical(other.dealID, dealID) || other.dealID == dealID) &&
            (identical(other.internalName, internalName) ||
                other.internalName == internalName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.normalPrice, normalPrice) ||
                other.normalPrice == normalPrice) &&
            (identical(other.thumb, thumb) || other.thumb == thumb));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, dealID, internalName, title, salePrice, normalPrice, thumb);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DealModelCopyWith<_$_DealModel> get copyWith =>
      __$$_DealModelCopyWithImpl<_$_DealModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DealModelToJson(
      this,
    );
  }
}

abstract class _DealModel extends DealModel {
  const factory _DealModel(
      {required final String dealID,
      final String internalName,
      final String title,
      @JsonKey(fromJson: _doubleFromString) required final double salePrice,
      @JsonKey(fromJson: _doubleFromString) required final double normalPrice,
      final String? thumb}) = _$_DealModel;
  const _DealModel._() : super._();

  factory _DealModel.fromJson(Map<String, dynamic> json) =
      _$_DealModel.fromJson;

  @override
  String get dealID;
  @override
  String get internalName;
  @override
  String get title;
  @override
  @JsonKey(fromJson: _doubleFromString)
  double get salePrice;
  @override
  @JsonKey(fromJson: _doubleFromString)
  double get normalPrice;
  @override
  String? get thumb;
  @override
  @JsonKey(ignore: true)
  _$$_DealModelCopyWith<_$_DealModel> get copyWith =>
      throw _privateConstructorUsedError;
}
