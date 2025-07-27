import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/config.dart';

part 'product.g.dart';
part 'product.freezed.dart';

List<Product> productsFromJson(List<dynamic> json) {
  return json.map((e) {
    return Product.fromJson(e);
  }).toList();
}

@freezed
class Product with _$Product {
  const factory Product(
      {@JsonKey(name: '_id') String? productId,
      String? productName,
      String? productShortDesc,
      String? productDesc,
      double? productPrice,
      double? productSalePrice,
      double? productSKU,
      String? productType,
      String? productStatus,
      String? stockStatus,
      String? productImage,
      List<String>? relatedProducts,
      @Default(false) bool? favourite}) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson({
        ...json,
        'productPrice': _toDouble(json['productPrice']),
        'productSalePrice': _toDouble(json['productSalePrice']),
        'productSKU': _toDouble(json['productSKU']),
      });

  static double? _toDouble(dynamic value) {
    if (value is num) {
      return value.toDouble();
    } else if (value is String) {
      return double.tryParse(value);
    } else {
      return null;
    }
  }
}

extension ProductExt on Product {
  String get fullImagePath =>
      Config.imageUrl + (productImage ?? "default_image.png");

  int get calculateDiscount {
    if (productPrice == null || productPrice == 0) return 0;

    double regularPrice = productPrice!;
    double salePrice = (productSalePrice != null && productSalePrice! > 0)
        ? productSalePrice!
        : regularPrice;

    double discount = regularPrice - salePrice;
    double dispercent = (discount / regularPrice) * 100;

    return dispercent.round();
  }

  bool get isFavourite => favourite ?? false;

  Product toggleFavourite() => copyWith(favourite: !(favourite ?? false));
}
