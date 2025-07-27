import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/components/widget_custom_stepper.dart';
import 'package:grocery_app/components/wiget_col_expand.dart';
import 'package:grocery_app/config.dart';
import 'package:grocery_app/models/product.dart';
import 'package:grocery_app/providers/providers.dart';
import 'package:grocery_app/widgets/widget_relatedProducts.dart';

class ProductDetailsPage extends ConsumerStatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends ConsumerState<ProductDetailsPage> {
  String? productId;
  int qty = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Map<String, dynamic> && args.containsKey('productId')) {
      setState(() {
        productId = args['productId'];
      });
      print("Product ID: $productId");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Details")),
      body: SingleChildScrollView(
        child: _productDetails(ref),
      ),
    );
  }

  Widget _productDetails(WidgetRef ref) {
    if (productId == null || productId!.isEmpty) {
      return const Center(child: Text("No product selected"));
    }

    final details = ref.watch(ProductDetailsProvider(productId!));

    return details.when(
      data: (model) {
        if (model == null) {
          return const Center(child: Text("Product not found"));
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _productDetailsUI(model),
            Relatedproducts(model.relatedProducts!),
            SizedBox(height: 10),
          ],
        );
      },
      error: (_, __) =>
          const Center(child: Text("Error loading product details")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _productDetailsUI(Product model) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.network(model.fullImagePath, fit: BoxFit.fitHeight),
          ),
          Text(
            model.productName ?? "Unknown Product",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "${Config.currency}${model.productPrice}",
                    style: TextStyle(
                      fontSize: 20,
                      color: model.calculateDiscount > 0
                          ? Colors.red
                          : Colors.black,
                      decoration: model.productSalePrice! > 0
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  if (model.calculateDiscount > 0)
                    Text(
                      " ${Config.currency}${model.productSalePrice}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                ],
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Text("SHARE", style: TextStyle(fontSize: 13)),
                label: const Icon(Icons.share, size: 20),
              ),
            ],
          ),
          Text("Availability: ${model.stockStatus}",
              style:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text("Product Code: ${model.productSKU}",
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomStepper(
                lowerLimit: 1,
                upperLimit: 20,
                stepValue: 1,
                iconSize: 22.0,
                value: qty,
                onValueChange: (value) {
                  qty = value["qty"];
                },
              ),
              TextButton.icon(
                onPressed: () {
                  final cartViewModel = ref.read(cartItemsProvider.notifier);
                  cartViewModel.addCartItem(model.productId as String, qty);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                ),
                icon: const Icon(Icons.shopping_basket, color: Colors.white),
                label: const Text("ADD TO CART",
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ColExpand(
            title: "SHORT DESCRIPTION",
            content: model.productShortDesc ?? "No description available.",
          ),
        ],
      ),
    );
  }
}
