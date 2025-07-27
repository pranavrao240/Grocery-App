import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/config.dart';
import 'package:grocery_app/main.dart';
import 'package:grocery_app/models/cart.dart';
import 'package:grocery_app/models/cart_product.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/models/login_response_model.dart';
import 'package:grocery_app/models/order_payment.dart';
import 'package:grocery_app/models/product.dart';
import 'package:grocery_app/models/productFilter.dart';
import 'package:grocery_app/models/slider.dart';
import 'package:grocery_app/pages/profile_page.dart';
import 'package:grocery_app/utils/shared_service.dart';
import 'package:http/http.dart' as http;

final apiservice = Provider((ref) => ApiService());

class ApiService {
  var data;
  static var client = http.Client();

  Future<List<Category>> getCategories(int page, int pageSize) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    };

    var url = Uri.http(Config.apiUrl, Config.categoryAPI, queryString);

    print("Request URL: $url");
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body);
        print("Category Response: ${response.body}");

        if (data['data'] != null && data['data'] is List) {
          List<dynamic> dataList = data['data'];
          print("Data List: $dataList");

          return categoriesFromJson(dataList);
        } else {
          print("Error: 'data' is not a list or is missing.");
          return [];
        }
      } catch (e) {
        print("JSON Parsing Error: $e");
        return [];
      }
    } else {
      print("Error: ${response.statusCode} - ${response.reasonPhrase}");
      return [];
    }
  }

  Future<List<Product>?> getProducts(ProductFilterModel pfm) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {
      'page': pfm.paginationModel.page.toString(),
      'pageSize': pfm.paginationModel.pageSize.toString(),
    };

    if (pfm.categoryId != null) {
      queryString["categoryId"] = pfm.categoryId!;
    }
    if (pfm.sortBy != null) {
      queryString["sort"] = pfm.sortBy!;
    }
    if (pfm.productIds != null) {
      queryString["productIds"] = pfm.productIds!.join(",");
    }

    var url = Uri.http(Config.apiUrl, Config.productAPI, queryString);

    print("Request URL: $url");
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("Response: ${response.body}");
      if (data['data'] != null && data['data'] is List) {
        return productsFromJson(data['data']);
      } else {
        print("Error: 'data' is not a list or is missing.");
        return null;
      }
    } else {
      print("Error: ${response.statusCode} - ${response.reasonPhrase}");
      return null;
    }
  }

  static Future<bool> registerUser(
      String fullName, String email, String password) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiUrl, Config.registerAPI);

    var response = await client.post(url,
        headers: requestHeaders,
        body: jsonEncode({
          "fullName": fullName,
          "email": email,
          "password": password,
        }));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> loginUser(
      BuildContext context, String email, String password) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiUrl, Config.loginAPI);

    var response = await client.post(url,
        headers: requestHeaders,
        body: jsonEncode({
          "email": email,
          "password": password,
        }));

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      var data = jsonDecode(response.body);

      String fullName = data["data"]["fullName"]; // Extract full name
      String userEmail = data["data"]["email"]; // Extract email

      return true;
    } else {
      return false;
    }
  }

  Future<List<SliderModel>?> getsliders(page, pageSize) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    };
    var url = Uri.http(Config.apiUrl, Config.sliderAPI, queryString);
    print("Request URL: $url");
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(response.body);
      return slidersFromJson(data['data']);
    } else {
      return null;
    }
  }

  Future<Product?> getProductDetails(String id) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiUrl, "${Config.productAPI}/$id");
    var res = await client.get(url, headers: requestHeaders);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      return Product.fromJson(data["data"]);
    } else {
      return null;
    }
  }

  Future<Cart?> getCart() async {
    var loginDetails = await SharedService.LoginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails?.data.token ?? ''}'
    };
    var url = Uri.http(Config.apiUrl, Config.CartAPI);
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // if (data == null || data["data"] == null) {
      //   print("Cart API returned null data");
      //   return null;
      // }
      print("Cart API Response from APIService: ${data["data"]}");
      return Cart.fromJson(data["data"]);
    } else if (response.statusCode == 401) {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil("/login", (route) => false);
    } else {
      return null;
    }
  }

  Future<bool?> addCartItem(productId, int qty) async {
    var loginDetails = await SharedService.LoginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails?.data.token ?? ''}',
    };

    var url = Uri.http(Config.apiUrl, Config.CartAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "products": [
          {"productId": productId, "qty": qty} // 🔹 Ensure qty is double
        ]
      }),
    );

    if (response.statusCode == 200) {
      print("Item added to cart successfully");
      return true;
    } else if (response.statusCode == 401) {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil("/login", (route) => false);
    } else {
      return null;
    }
    return null;
  }

  Future<bool?> deleteCartItem(String productId, double qty) async {
    var loginDetails = await SharedService.LoginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails?.data.token ?? ''}'
    };

    var url = Uri.http(Config.apiUrl, Config.CartAPI);
    var response = await client.delete(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "products": [
          {"productId": productId, "qty": qty}
        ]
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil("/login", (route) => false);
    } else {
      return null;
    }
    return null;
  }

  Future<Map<String, dynamic>> processPayment(
    customerAddress,
    cardHolderName,
    cardNumber,
    cardExpMonth,
    cardExpYear,
    cardCVC,
    amount,
  ) async {
    var loginDetails = await SharedService.LoginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails?.data.token ?? ''}'
    };

    var url = Uri.http(Config.apiUrl, Config.orderAPI);
    var response = await ApiService.client.post(url,
        headers: requestHeaders,
        body: jsonEncode({
          "customerAddress": customerAddress,
          "customerName": cardHolderName,
          "cardNumber": cardNumber,
          "cardExpMonth": cardExpMonth,
          "cardExpYear": cardExpYear,
          "cardCVC": cardCVC,
          "amount": amount,
        }));
    print("Customer Address: $customerAddress");

    Map<String, dynamic> resModel = {};
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("Payment Response: ${response.body}");
      resModel["message"] = "success";
      resModel["data"] = OrderPayment.fromJson(data["data"]);
    } else if (response.statusCode == 401) {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil("/login", (route) => false);
    } else {
      var data = jsonDecode(response.body);
      resModel["message"] = data["message"];
      print("Payment Error: ${response.body}");
      return resModel;
    }
    return resModel;
  }

  Future<bool> updateOrder(orderId, transactionId) async {
    var loginDetails = await SharedService.LoginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails?.data.token ?? ''}'
    };

    var url = Uri.http(Config.apiUrl, Config.orderAPI);
    var response = await ApiService.client.put(url,
        headers: requestHeaders,
        body: jsonEncode({
          "orderId": orderId,
          "status": "Success",
          "transactionId": transactionId,
        }));

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil("/login", (route) => false);
    } else {
      return false;
    }
    return false;
  }
}
