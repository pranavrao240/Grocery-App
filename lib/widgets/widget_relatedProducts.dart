import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/components/product_card.dart';
import 'package:grocery_app/models/pagination.dart';
import 'package:grocery_app/models/product.dart';
import 'package:grocery_app/models/productFilter.dart';
import 'package:grocery_app/providers/providers.dart';

class Relatedproducts extends ConsumerWidget {
  const Relatedproducts(this.relatedproducts, {super.key});
  final List<String> relatedproducts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.grey,
      child: Column(
        children: [
          Text(
            "Related Products",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Visibility(
            visible: relatedproducts.isNotEmpty,
            child: _productList(ref),
          )
        ],
      ),
    );
  }

  Widget _productList(WidgetRef ref) {
    final products = ref.watch(relatedProductProvider(ProductFilterModel(
        paginationModel: PaginationModel(page: 1, pageSize: 10),
        productIds: relatedproducts)));
    return products.when(
        data: (list) {
          return _buildProductList(list!);
        },
        error: (_, __) {
          return const Text('Error');
        },
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget _buildProductList(List<Product> products) {
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          var data = products[index];
          return GestureDetector(
            onTap: () {},
            child: ProductCard(model: data),
          );
        },
      ),
    );
  }
}
