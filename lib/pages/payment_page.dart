import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/config.dart';
import 'package:grocery_app/models/cart.dart';
import 'package:grocery_app/models/order_payment.dart';
import 'package:grocery_app/providers/providers.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class PaymentPage extends ConsumerStatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

class _PaymentPageState extends ConsumerState<PaymentPage> {
  String cardHolderName = "";
  String cardNumber = "";
  String validExp = "";
  String cardCVC = "";
  String customerAddress = "";

  @override
  Widget build(BuildContext context) {
    final orderPaymentModel = ref.watch(orderPaymentProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
      ),
      body: ProgressHUD(
        child: Form(
          key: globalKey,
          child: _paymentUI(context, ref),
        ),
        inAsyncCall: orderPaymentModel.isLoading,
        opacity: 0.3,
        key: UniqueKey(),
      ),
    );
  }

  _paymentUI(BuildContext context, WidgetRef ref) {
    final cartProider = ref.watch(cartItemsProvider);
    if (cartProider.cartModel != null) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const Text("Personal Details",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black)),
            FormHelper.inputFieldWidgetWithLabel(
                context, "CustomerAddr", "Customer Address", "Your Address",
                (onValidate) {
              if (onValidate.isEmpty) {
                return "* required";
              }
            }, (onSaved) {
              customerAddress = onSaved.toString().trim();
            },
                showPrefixIcon: true,
                prefixIcon: const Icon(Icons.face),
                borderColor: Colors.grey,
                contentPadding: 10,
                borderRadius: 10,
                fontSize: 14,
                paddingLeft: 0,
                paddingRight: 0,
                prefixIconPaddingLeft: 10,
                textColor: Colors.black,
                prefixIconColor: Colors.black,
                hintColor: Colors.black.withOpacity(.6),
                borderFocusColor: Colors.grey.shade200,
                backgroundColor: Colors.grey.shade100),
            const Text(
              "Payment Details",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                "${Config.currency} ${cartProider.cartModel!.grandTotal.toString()}",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
            FormHelper.inputFieldWidgetWithLabel(
                context, "CardHolderName", "Card Holder", "Your Name",
                (onValidate) {
              if (onValidate.isEmpty) {
                return "* required";
              }
            }, (onSaved) {
              cardHolderName = onSaved.toString().trim();
            },
                showPrefixIcon: true,
                prefixIcon: const Icon(Icons.face),
                borderColor: Colors.grey,
                contentPadding: 10,
                borderRadius: 10,
                fontSize: 14,
                paddingLeft: 0,
                paddingRight: 0,
                prefixIconPaddingLeft: 10,
                textColor: Colors.black,
                prefixIconColor: Colors.black,
                hintColor: Colors.black.withOpacity(.6),
                borderFocusColor: Colors.grey.shade200,
                backgroundColor: Colors.grey.shade100),
            SizedBox(
              height: 20,
            ),
            FormHelper.inputFieldWidgetWithLabel(
                context, "CardNumber", "Card Number", "Card Number",
                (onValidate) {
              if (onValidate.isEmpty) {
                return "* required";
              }
            }, (onSaved) {
              cardNumber = onSaved.toString().trim();
            },
                showPrefixIcon: true,
                prefixIcon: const Icon(Icons.face),
                borderColor: Colors.grey,
                contentPadding: 10,
                borderRadius: 10,
                fontSize: 14,
                paddingLeft: 0,
                paddingRight: 0,
                prefixIconPaddingLeft: 10,
                textColor: Colors.black,
                prefixIconColor: Colors.black,
                hintColor: Colors.black.withOpacity(.6),
                borderFocusColor: Colors.grey.shade200,
                backgroundColor: Colors.grey.shade100),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  child: FormHelper.inputFieldWidgetWithLabel(
                      context, "validExp", "validExp ", "Month/Year",
                      (onValidate) {
                    if (onValidate.isEmpty) {
                      return "* required";
                    }
                  }, (onSaved) {
                    validExp = onSaved.toString().trim();
                  },
                      showPrefixIcon: true,
                      prefixIcon: const Icon(Icons.face),
                      borderColor: Colors.grey,
                      contentPadding: 10,
                      borderRadius: 10,
                      fontSize: 14,
                      paddingLeft: 0,
                      paddingRight: 0,
                      prefixIconPaddingLeft: 10,
                      textColor: Colors.black,
                      prefixIconColor: Colors.black,
                      hintColor: Colors.black.withOpacity(.6),
                      borderFocusColor: Colors.grey.shade200,
                      backgroundColor: Colors.grey.shade100),
                ),
                Flexible(
                  child: FormHelper.inputFieldWidgetWithLabel(
                      context, "CVV", "CVV ", "CVV", (onValidate) {
                    if (onValidate.isEmpty) {
                      return "* required";
                    }
                  }, (onSaved) {
                    cardCVC = onSaved.toString().trim();
                  },
                      showPrefixIcon: false,
                      borderColor: Colors.grey,
                      contentPadding: 10,
                      borderRadius: 10,
                      fontSize: 14,
                      paddingLeft: 0,
                      paddingRight: 0,
                      textColor: Colors.black,
                      hintColor: Colors.black.withOpacity(.6),
                      borderFocusColor: Colors.grey.shade200,
                      backgroundColor: Colors.grey.shade100),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: FormHelper.submitButton(
                "Proceed To Confirm",
                () async {
                  if (validateAndSave()) {
                    final orderPaymentModel =
                        ref.read(orderPaymentProvider.notifier);

                    await orderPaymentModel.processPayment(
                        customerAddress,
                        cardHolderName,
                        cardNumber,
                        validExp,
                        cardCVC,
                        cartProider.cartModel!.grandTotal.toString());

                    final OrderPaymentResponseModel =
                        ref.watch(orderPaymentProvider);
                    if (!OrderPaymentResponseModel.isSuccess) {
                      FormHelper.showSimpleAlertDialog(context, Config.appName,
                          OrderPaymentResponseModel.message, "OK", () {
                        Navigator.of(context).pop();
                      });
                    } else {}
                  }
                },
                btnColor: Colors.blue,
                borderColor: Colors.white,
                txtColor: Colors.white,
                borderRadius: 10,
                width: 200,
              ),
            )
          ],
        ),
      );
    }
    return const CircularProgressIndicator();
  }
}

bool validateAndSave() {
  final form = globalKey.currentState;
  if (form!.validate()) {
    form.save();
    return true;
  }
  return false;
}
