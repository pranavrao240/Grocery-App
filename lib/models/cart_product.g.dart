// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartproductImpl _$$CartproductImplFromJson(Map<String, dynamic> json) =>
    _$CartproductImpl(
      qty: (json['qty'] as num).toDouble(),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CartproductImplToJson(_$CartproductImpl instance) =>
    <String, dynamic>{
      'qty': instance.qty,
      'product': instance.product,
    };
