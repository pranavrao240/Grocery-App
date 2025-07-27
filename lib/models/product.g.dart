// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      productId: json['_id'] as String?,
      productName: json['productName'] as String?,
      productShortDesc: json['productShortDesc'] as String?,
      productDesc: json['productDesc'] as String?,
      productPrice: (json['productPrice'] as num?)?.toDouble(),
      productSalePrice: (json['productSalePrice'] as num?)?.toDouble(),
      productSKU: (json['productSKU'] as num?)?.toDouble(),
      productType: json['productType'] as String?,
      productStatus: json['productStatus'] as String?,
      stockStatus: json['stockStatus'] as String?,
      productImage: json['productImage'] as String?,
      relatedProducts: (json['relatedProducts'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      favourite: json['favourite'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      '_id': instance.productId,
      'productName': instance.productName,
      'productShortDesc': instance.productShortDesc,
      'productDesc': instance.productDesc,
      'productPrice': instance.productPrice,
      'productSalePrice': instance.productSalePrice,
      'productSKU': instance.productSKU,
      'productType': instance.productType,
      'productStatus': instance.productStatus,
      'stockStatus': instance.stockStatus,
      'productImage': instance.productImage,
      'relatedProducts': instance.relatedProducts,
      'favourite': instance.favourite,
    };
