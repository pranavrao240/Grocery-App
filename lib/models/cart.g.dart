// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      userId: json['userId'] as String? ?? 'Unknown',
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => Cartproduct.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      cartId: json['cartId'] as String? ?? 'Unknown',
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'products': instance.products.map((e) => e.toJson()).toList(),
      'cartId': instance.cartId,
    };
