import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/api/api_service.dart';
import 'package:grocery_app/application/notifier/cart_notifier.dart';
import 'package:grocery_app/application/notifier/order_payment_notifier.dart';
import 'package:grocery_app/application/notifier/product_filter_notifier.dart';
import 'package:grocery_app/application/notifier/products_notifier.dart';
import 'package:grocery_app/application/state/cart_state.dart';
import 'package:grocery_app/application/state/order_payment_state.dart';
import 'package:grocery_app/application/state/product_state.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/models/order_payment.dart';
import 'package:grocery_app/models/pagination.dart';
import 'package:grocery_app/models/product.dart';
import 'package:grocery_app/models/productFilter.dart';
import 'package:grocery_app/models/slider.dart';

final categoriesProvider =
    FutureProvider.family<List<Category>, PaginationModel>(
  (ref, paginationModel) async {
    print(
        "🟢 categoriesProvider called with page: ${paginationModel.page}, pageSize: ${paginationModel.pageSize}");

    final apiRepository = ref.watch(apiservice);

    try {
      List<Category> categories = await apiRepository.getCategories(
        paginationModel.page,
        paginationModel.pageSize,
      );

      print("🟣 categoriesProvider received: ${categories.length} categories");

      return categories;
    } catch (e) {
      print("🔴 Error in categoriesProvider: $e");
      throw Exception("Failed to fetch categories: $e");
    }
  },
);

final productsProvider =
    FutureProvider.family<List<Product>?, ProductFilterModel>((ref, pfm) {
  final apiRepository = ref.watch(apiservice);

  return apiRepository.getProducts(pfm);
});

final productsFilterProvider =
    StateNotifierProvider<ProductFilterNotifier, ProductFilterModel>(
        (ref) => ProductFilterNotifier());

final productsNotifierProvider =
    StateNotifierProvider<ProductsNotifier, ProductState>((ref) =>
        ProductsNotifier(
            ref.watch(apiservice), ref.watch(productsFilterProvider)));

final slidersProvider =
    FutureProvider.family<List<SliderModel>?, PaginationModel>(
        (ref, paginationModel) {
  final sliderRepo = ref.watch(apiservice);

  return sliderRepo.getsliders(paginationModel.page, paginationModel.pageSize);
});

final ProductDetailsProvider = FutureProvider.family<Product?, String>(
  (ref, productId) {
    final apiRepository = ref.watch(apiservice);
    return apiRepository.getProductDetails(productId);
  },
);

final relatedProductProvider =
    FutureProvider.family<List<Product>?, ProductFilterModel>(
  (ref, pfm) {
    final apiRepository = ref.watch(apiservice);
    return apiRepository.getProducts(pfm);
  },
);
final cartItemsProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  final api = ref.watch(apiservice);
  print("API Service instance: $api"); // Debugging
  return CartNotifier(api);
});

final orderPaymentProvider =
    StateNotifierProvider<OrderPaymentNotifier, OrderPaymentState>(
  (ref) => OrderPaymentNotifier(ref.watch(apiservice)),
);
