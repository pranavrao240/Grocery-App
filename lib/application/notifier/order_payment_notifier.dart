import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:grocery_app/api/api_service.dart';
import 'package:grocery_app/application/state/order_payment_state.dart';
import 'package:grocery_app/models/order_payment.dart';

class OrderPaymentNotifier extends StateNotifier<OrderPaymentState> {
  final ApiService _apiService;
  OrderPaymentNotifier(this._apiService) : super(const OrderPaymentState());

  Future<void> processPayment(
    customerAddress,
    cardHolderName,
    cardNumber,
    cardExp,
    cardCVC,
    amount,
  ) async {
    state = state.copyWith(isLoading: true);
    var cardEx = cardExp.toString().split("/");
    final orderPaymentResData = await _apiService.processPayment(
      customerAddress,
      cardHolderName,
      cardNumber,
      cardEx[0],
      cardEx[1],
      cardCVC,
      amount,
    );

    state = state.copyWith(message: orderPaymentResData["message"]);
    state = state.copyWith(isLoading: false);
    if (orderPaymentResData["data"] != null) {
      OrderPayment orderPayment = orderPaymentResData["data"] as OrderPayment;
      state = state.copyWith(orderPaymentResponseModel: orderPayment);
      final stripeResponse = await Stripe.instance.confirmPayment(
          paymentIntentClientSecret: orderPayment.client_secret,
          data: PaymentMethodParams.cardFromMethodId(
              paymentMethodData: PaymentMethodDataCardFromMethod(
                  paymentMethodId: orderPayment.cardID)));

      if (stripeResponse.status == PaymentIntentsStatus.Succeeded) {
        var response = await _apiService.updateOrder(
            orderPayment.orderID, stripeResponse.id);
        if (response!) {
          state = state.copyWith(isSuccess: true);
        }
      }
    }

    state = state.copyWith(isLoading: false);
  }
}
