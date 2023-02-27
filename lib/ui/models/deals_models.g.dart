// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deals_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DealModel _$$_DealModelFromJson(Map<String, dynamic> json) => _$_DealModel(
      dealID: json['dealID'] as String,
      internalName: json['internalName'] as String? ?? "",
      title: json['title'] as String? ?? "",
      salePrice: json['salePrice'] as String,
      normalPrice: json['normalPrice'] as String,
      thumb: json['thumb'] as String?,
    );

Map<String, dynamic> _$$_DealModelToJson(_$_DealModel instance) =>
    <String, dynamic>{
      'dealID': instance.dealID,
      'internalName': instance.internalName,
      'title': instance.title,
      'salePrice': instance.salePrice,
      'normalPrice': instance.normalPrice,
      'thumb': instance.thumb,
    };
