import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/api/api_service.dart';
import 'package:grocery_app/application/state/product_state.dart';
import 'package:grocery_app/models/pagination.dart';
import 'package:grocery_app/models/productFilter.dart';

class ProductsNotifier extends StateNotifier<ProductState> {
  final ApiService _apiService;
  final ProductFilterModel _filterModel;

  ProductsNotifier(this._apiService, this._filterModel) : super(ProductState());

  int _page = 1;

  Future<void> getProducts() async {
    if (state.isLoading || !state.hasNext) return;

    try {
      state = state.copyWith(isLoading: true);

      final filterModel = _filterModel.copyWith(
        paginationModel: PaginationModel(page: _page, pageSize: 10),
      );

      final products = await _apiService.getProducts(filterModel) ?? [];

      final newProducts = [...state.products, ...products];

      if (products.length < 10) {
        state = state.copyWith(hasNext: false);
      }

      _page++;
      state = state.copyWith(products: newProducts, isLoading: false);
    } catch (e, stack) {
      debugPrint("❌ Error in getProducts: $e\n$stack");
      state = state.copyWith(isLoading: false);
    }
  }

  // Future<void> getProducts() async {
  //   if (state.isLoading || !state.hasNext) {
  //     return;
  //   }

  //   state = state.copyWith(isLoading: true);
  //   var filterModel = _filterModel.copyWith(
  //       paginationModel: PaginationModel(page: _page, pageSize: 10));
  //   final products = await _apiService.getProducts(filterModel);
  //   final newProducts = [...state.products, ...products!];
  //   print("FilterModel $filterModel");
  //   print("Products $products");

  //   if (products.length % 10 != 0 || products.isEmpty) {
  //     state = state.copyWith(hasNext: false);
  //   }

  //   state = state.copyWith(products: newProducts);

  //   _page++;
  //   state = state.copyWith(isLoading: false);
  // }

  Future<void> refreshProducts() async {
    state = state.copyWith(products: [], hasNext: true);
    _page = 1;

    await getProducts();
  }
}
