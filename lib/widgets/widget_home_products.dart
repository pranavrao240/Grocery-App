import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/models/pagination.dart';
import 'package:grocery_app/models/product.dart';
import 'package:grocery_app/models/productFilter.dart';
import 'package:grocery_app/providers/providers.dart';
import 'package:grocery_app/components/product_card.dart';

class WidgetHomeProducts extends ConsumerWidget {
  const WidgetHomeProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> models = List.empty(growable: true);

    return Container(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Top 10 Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          Padding(padding: EdgeInsets.all(8.0), child: _productsList(ref))
        ],
      ),
    );
  }

  Widget _productsList(WidgetRef ref) {
    final products = ref.watch(productsProvider(ProductFilterModel(
        paginationModel: PaginationModel(page: 1, pageSize: 10))));

    return products.when(
        data: (list) {
          print("data running");
          return _buildProductList(list!);
        },
        error: (error, stackTrace) {
          debugPrint('Error: $error');
          debugPrint('StackTrace: $stackTrace');

          return const Center(
            child: Text("Error loading products:"),
          );
        },
        loading: () => const Center(
              // print("data loading");
              child: CircularProgressIndicator(),
            ));
  }

  Widget _buildProductList(List<Product> product) {
    return Container(
      height: 300,
      width: 500,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: product.length,
        itemBuilder: (context, index) {
          var data = product[index];
          return GestureDetector(
            onTap: () {},
            child: ProductCard(model: data),
          );
        },
      ),
    );
  }
}
