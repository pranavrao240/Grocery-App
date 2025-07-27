import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/models/pagination.dart';
import 'package:grocery_app/models/productFilter.dart';
import 'package:grocery_app/models/product_sort_model.dart';
import 'package:grocery_app/providers/providers.dart';
import 'package:grocery_app/components/product_card.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String? categoryId;
  String? categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
        ),
        body: Container(
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProductsFilter(
                  categoryId: categoryId, categoryName: categoryName),
              Flexible(
                flex: 1,
                child: _ProductList(),
              )
            ],
          ),
        ));
  }

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map?;

    if (arguments != null) {
      categoryName = arguments['categoryName'];
      categoryId = arguments['categoryId'];
    }
    super.didChangeDependencies();
  }
}

class _ProductsFilter extends ConsumerWidget {
  final _sortByOptions = [
    ProductSortModel(value: "createdAt", label: "Latest"),
    ProductSortModel(value: "-productPrice", label: "Price High to Low"),
    ProductSortModel(value: "productPrice", label: "Price Low to Low"),
  ];

  _ProductsFilter({
    this.categoryId,
    this.categoryName,
  });

  final String? categoryName;
  final String? categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterprovider = ref.watch(productsFilterProvider);
    print("Category ID: $categoryId");

    return Container(
      height: 40,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            categoryName!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Container(
              decoration: BoxDecoration(color: Colors.grey),
              child: PopupMenuButton(
                onSelected: (sortBy) {
                  ProductFilterModel filterModel = ProductFilterModel(
                      paginationModel: PaginationModel(page: 0, pageSize: 10),
                      categoryId: filterprovider.categoryId,
                      sortBy: sortBy.toString());
                  ref
                      .read(productsFilterProvider.notifier)
                      .setProductFilter(filterModel);
                  ref.read(productsNotifierProvider.notifier).getProducts();
                },
                initialValue: filterprovider.sortBy,
                itemBuilder: (context) {
                  return _sortByOptions.map((item) {
                    return PopupMenuItem(
                      value: item.value,
                      child: InkWell(child: Text(item.label!)),
                    );
                  }).toList();
                },
                icon: const Icon(Icons.filter_list_alt),
              ))
        ],
      ),
    );
  }
}

class _ProductList extends ConsumerWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productsNotifierProvider);
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          final productViewModel = ref.read(productsNotifierProvider.notifier);

          final productState = ref.watch(productsNotifierProvider);

          if (productState.hasNext) productViewModel.getProducts();
        }
      },
    );
    print("Products length: ${productState.products.length}");
    print("Is Loading: ${productState.isLoading}");
    print("Has Next: ${productState.hasNext}");
    print("Products length: ${productState.products.length}");

    if (productState.products.isEmpty) {
      if (!productState.hasNext && !productState.isLoading) {
        return Center(
            child: Text("No Products: ${productState.products.length}"));
      }
      return LinearProgressIndicator();
    }
    return Column(children: [
      Flexible(
          flex: 1,
          child: GridView.count(
            crossAxisCount: 2,
            controller: _scrollController,
            children: List.generate(productState.products.length, (index) {
              return ProductCard(model: productState.products[index]);
            }),
          )),
      Visibility(
        visible: productState.isLoading && productState.products.isNotEmpty,
        child:
            SizedBox(width: 35, height: 35, child: CircularProgressIndicator()),
      )
    ]);
  }
}
