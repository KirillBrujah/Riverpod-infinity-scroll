import 'package:freezed_annotation/freezed_annotation.dart';

part 'deals_models.freezed.dart';
part 'deals_models.g.dart';

@freezed
class DealModel with _$DealModel {
  const factory DealModel({
    required String dealID,
    @Default("") String internalName,
    @Default("") String title,
    required String salePrice,
    required String normalPrice,
    String? thumb,
  }) = _DealModel;

  factory DealModel.fromJson(Map<String, dynamic> json) =>
      _$DealModelFromJson(json);
}
