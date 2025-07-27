// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:grocery_app/config.dart';
// import 'package:grocery_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/config.dart';
import 'package:grocery_app/models/product.dart';

class ProductCard extends StatefulWidget {
  final Product model;

  const ProductCard({super.key, required this.model});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late Product currentProduct;
  bool isFavorited = false; // ✅ Moved here
  bool isPressed = false;

  @override
  void initState() {
    currentProduct = widget.model;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Column(
        children: [
          Visibility(
            visible: widget.model.calculateDiscount > 0,
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(
                        color: const Color.fromARGB(255, 57, 136, 60))),
                child: Text('${widget.model.calculateDiscount}% OFF'),
              ),
            ),
          ),
          GestureDetector(
            child: SizedBox(
              child: Image.network(
                widget.model.fullImagePath,
                height: 150,
                width: 140,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed("/product-details",
                  arguments: {'productId': widget.model.productId});
              print(
                  "here is model of ${widget.model.productId} is: ${widget.model}");
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    Config.currency + widget.model.productPrice.toString(),
                    style: const TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough),
                  ),
                  Text(" ${Config.currency}${widget.model.calculateDiscount}"),
                ],
              ),
              Text(widget.model.productName.toString()),
              IconButton(
                icon: Icon(
                  isFavorited ? Icons.favorite : Icons.favorite_border,
                  color: isFavorited
                      ? Colors.pink
                      : const Color.fromARGB(255, 1, 1, 1),
                ),
                onPressed: () {
                  setState(() {
                    currentProduct = currentProduct.toggleFavourite();
                    isFavorited = !isFavorited;
                    print(currentProduct.toJson());

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(isFavorited
                            ? '${currentProduct.productName} added to favorites'
                            : '${currentProduct.productName} removed from favorites'),
                      ),
                    );
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
