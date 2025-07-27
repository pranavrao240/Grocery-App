import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/components/product_card.dart';
import 'package:grocery_app/providers/providers.dart';

class WishlistPage extends ConsumerStatefulWidget {
  const WishlistPage({super.key});

  @override
  ConsumerState<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends ConsumerState<WishlistPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final productState = ref.read(productsNotifierProvider);

      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          productState.hasNext) {
        ref.read(productsNotifierProvider.notifier).getProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productsNotifierProvider);

    // ✅ Filter only favorited products
    final favoriteProducts = productState.products
        .where((product) => product.favourite == true)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(12),
        child: productState.isLoading && favoriteProducts.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : favoriteProducts.isEmpty
                ? const Center(child: Text("No Products in Wishlist"))
                : Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          controller: _scrollController,
                          itemCount: favoriteProducts.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: (context, index) {
                            return ProductCard(model: favoriteProducts[index]);
                          },
                        ),
                      ),
                      if (productState.isLoading &&
                          productState.products.isNotEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: CircularProgressIndicator(),
                        ),
                    ],
                  ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
