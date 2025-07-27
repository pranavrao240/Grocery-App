import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_payment.freezed.dart';
part 'order_payment.g.dart';

@freezed
abstract class OrderPayment with _$OrderPayment {
  factory OrderPayment({
    required String stripeCustomerID,
    required String cardID,
    required String paymentIntentID,
    required String orderID,
    required String client_secret,
  }) = _OrderPayment;

  factory OrderPayment.fromJson(Map<String, dynamic> json) =>
      _$OrderPaymentFromJson(json);
}
