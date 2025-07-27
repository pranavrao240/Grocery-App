import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/config.dart';
import 'package:grocery_app/models/cart.dart';
import 'package:grocery_app/models/cart_product.dart';
import 'package:grocery_app/providers/providers.dart';
import 'package:grocery_app/widgets/widget_cart_item.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      bottomNavigationBar: CheckoutButtonNavbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Expanded(child: _cartList(ref)),
          Flexible(
            flex: 1,
            child: _cartList(ref),
          )
        ],
      ),
    );
  }

  Widget _buildCartItems(List<Cartproduct> cartProducts, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: cartProducts.length,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return CartItemWidget(
          model: cartProducts[index],
          onQtyUpdate: (Cartproduct model, qty, type) {
            final cartViewModel = ref.read(cartItemsProvider.notifier);
            cartViewModel.updatedQty(model.product.productId!, qty, type);
          },
          onItemRemove: (Cartproduct model) {
            final cartViewModel = ref.read(cartItemsProvider.notifier);
            cartViewModel.removeCartItem(model.product.productId, model.qty);
          },
        );
      },
    );
  }

  Widget _cartList(WidgetRef ref) {
    final cartState = ref.watch(cartItemsProvider);
    print("CartState:${cartState.cartModel}");

    print("Cart API Response: ${cartState.cartModel}");

    if (cartState.cartModel == null) {
      return const LinearProgressIndicator();
    }
    if (cartState.cartModel!.products.isEmpty) {
      return const Center(child: Text('Your cart is empty'));
    }

    print("Cart Products: ${cartState.cartModel!.products}");

    return _buildCartItems(cartState.cartModel!.products, ref);
  }
}

class CheckoutButtonNavbar extends ConsumerWidget {
  const CheckoutButtonNavbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProvider = ref.watch(cartItemsProvider);

    if (cartProvider.cartModel != null)
      // ignore: curly_braces_in_flow_control_structures
      return cartProvider.cartModel!.products.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:${Config.currency}${cartProvider.cartModel!.grandTotal.toString()}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          child: const Text(
                            "Proceed to Checkout",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('/payments');
                          },
                        )
                      ],
                    ),
                  )),
            )
          : const SizedBox();

    return const SizedBox();
  }
}
