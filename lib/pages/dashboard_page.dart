import 'package:flutter/material.dart';
import 'package:grocery_app/pages/cart_page.dart';
import 'package:grocery_app/pages/homepage.dart';
import 'package:grocery_app/pages/profile_page.dart';
import 'package:grocery_app/pages/wishlist_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

String fullName = "Guest User";
String email = "guest@example.com";

class _DashboardPageState extends State<DashboardPage> {
  final List<Widget> widgetList = [
    Homepage(),
    const CartPage(),
    const WishlistPage(),
    ProfilePage(fullName: fullName, email: email),
  ];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black,
        currentIndex: index,
        onTap: (newindex) {
          setState(() {
            index = newindex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), label: 'Store'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: 'My Account'),
        ],
      ),
      body: widgetList[index],
    );
  }
}
