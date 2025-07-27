// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderPaymentImpl _$$OrderPaymentImplFromJson(Map<String, dynamic> json) =>
    _$OrderPaymentImpl(
      stripeCustomerID: json['stripeCustomerID'] as String,
      cardID: json['cardID'] as String,
      paymentIntentID: json['paymentIntentID'] as String,
      orderID: json['orderID'] as String,
      client_secret: json['client_secret'] as String,
    );

Map<String, dynamic> _$$OrderPaymentImplToJson(_$OrderPaymentImpl instance) =>
    <String, dynamic>{
      'stripeCustomerID': instance.stripeCustomerID,
      'cardID': instance.cardID,
      'paymentIntentID': instance.paymentIntentID,
      'orderID': instance.orderID,
      'client_secret': instance.client_secret,
    };
