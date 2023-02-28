import 'package:freezed_annotation/freezed_annotation.dart';

part 'deals_models.freezed.dart';
part 'deals_models.g.dart';

@freezed
class DealModel with _$DealModel {
  const DealModel._();

  const factory DealModel({
    required String dealID,
    @Default("") String internalName,
    @Default("") String title,
    @JsonKey(fromJson: _doubleFromString) required double salePrice,
    @JsonKey(fromJson: _doubleFromString) required double normalPrice,
    String? thumb,
  }) = _DealModel;

  factory DealModel.fromJson(Map<String, dynamic> json) =>
      _$DealModelFromJson(json);

  int get discountPercent => (100 - (salePrice * 100 / normalPrice)).round();
}

double _doubleFromString(dynamic value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.parse(value);

  return .0;
}
