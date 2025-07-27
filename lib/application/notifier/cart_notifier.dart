import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/api/api_service.dart';
import 'package:grocery_app/application/state/cart_state.dart';
import 'package:grocery_app/models/cart.dart';
import 'package:grocery_app/models/cart_product.dart';

class CartNotifier extends StateNotifier<CartState> {
  final ApiService _apiService;

  CartNotifier(this._apiService) : super(const CartState()) {
    getCartItems();
  }

  Future<void> getCartItems() async {
    state = state.copyWith(isLoading: true);
    try {
      final cartData = await _apiService.getCart();
      print("Fetched Cart Data: $cartData"); // Debugging

      if (cartData != null) {
        state = state.copyWith(cartModel: cartData);
      } else {
        state = state.copyWith(error: "Cart data is null");
      }
    } catch (e) {
      print("Error fetching cart: $e");
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// Adds item to cart and refreshes cart
  Future<void> addCartItem(String productId, int qty) async {
    try {
      await _apiService.addCartItem(productId, qty);
      await getCartItems();
    } catch (e) {
      print("Error adding item: $e");
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> removeCartItem(productId, qty) async {
    await _apiService.deleteCartItem(productId, qty);

    var isCartItemExist = state.cartModel!.products
        .firstWhere((ele) => ele.product!.productId == productId);

    var updatedItems = state.cartModel!;

    final updatedProducts = List<Cartproduct>.from(updatedItems.products);

    updatedProducts.remove(isCartItemExist);

    final newCartModel = updatedItems.copyWith(products: updatedProducts);

    state = state.copyWith(cartModel: newCartModel);
  }

  Future<void> updatedQty(String productId, int qty, String type) async {
    if (state.cartModel == null) return;

    var updatedItems = state.cartModel;

    final updatedProductList = List<Cartproduct>.from(updatedItems!.products);

    final cartItemIndex = updatedProductList.indexWhere(
      (item) => item.product!.productId == productId,
    );

    if (cartItemIndex == -1) return;

    final cartItem = updatedProductList[cartItemIndex];

    if (type == "-") {
      await _apiService.deleteCartItem(productId, 1);

      if (cartItem.qty > 1) {
        updatedProductList[cartItemIndex] = Cartproduct(
          qty: cartItem.qty - 1,
          product: cartItem.product,
        );
      } else {
        updatedProductList.removeAt(cartItemIndex);
      }
    } else {
      await _apiService.addCartItem(productId, 1);

      updatedProductList[cartItemIndex] = Cartproduct(
        qty: cartItem.qty + 1,
        product: cartItem.product,
      );
    }

    // Update the cart model with the modified product list
    state = state.copyWith(
      cartModel: updatedItems.copyWith(products: updatedProductList),
    );
  }
}
