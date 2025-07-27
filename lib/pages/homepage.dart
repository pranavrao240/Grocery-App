import 'package:flutter/material.dart';
import 'package:grocery_app/models/product.dart';
import 'package:grocery_app/widgets/slider_widget.dart';
import 'package:grocery_app/widgets/widget_home_categories.dart';
import 'package:grocery_app/widgets/widget_home_products.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        child: ListView(
          children: [
            const HomeSliderWidget(),
            const WidgetHomeCategories(),
            // ProductCard(
            //   model: model,
            // ),
            WidgetHomeProducts()
          ],
        ),
      ),
    );
  }
}
