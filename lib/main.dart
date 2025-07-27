import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:grocery_app/pages/dashboard_page.dart';
import 'package:grocery_app/pages/homepage.dart';
import 'package:grocery_app/pages/login_page.dart';
import 'package:grocery_app/pages/productDetailsPage.dart';
import 'package:grocery_app/pages/products_page.dart';
import 'package:grocery_app/pages/profile_page.dart';
import 'package:grocery_app/pages/register_page.dart';
import 'package:grocery_app/pages/wishlist_page.dart';
import 'package:grocery_app/widgets/slider_widget.dart';
import 'package:grocery_app/utils/shared_service.dart';

import 'pages/payment_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Widget _defaultHome = const LoginPage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool result = await SharedService.isLoggedIn();

  if (result) {
    _defaultHome = const DashboardPage();
    // _defaultHome = const ProfilePage();
  }
  Stripe.publishableKey =
      "pk_test_51Qy8f5PMnrXdxg1VNZgGh3ClOLbPPIDMqNEOasCmuPtGYY9Nv4G93W7PKBInl40z0QOE31EeJwPJS4ItTHdeEm0W00QfFtFVye";
  await Stripe.instance.applySettings();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      // home: const DashboardPage(),
      routes: <String, WidgetBuilder>{
        '/': (context) => _defaultHome,
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const Homepage(),
        '/product': (context) => const ProductsPage(),
        '/product-details': (context) => const ProductDetailsPage(),
        '/payments': (context) => const PaymentPage(),
      },
    );
  }
}
