// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'product.dart';

// part 'cart_product.freezed.dart';
// part 'cart_product.g.dart';

// @freezed
// abstract class Cartproduct with _$Cartproduct {
//   factory Cartproduct({
//     required double qty,
//     Product? product, // Ensure product is always required
//   }) = _Cartproduct;

//   factory Cartproduct.fromJson(Map<String, dynamic> json) {
//     final formattedJson = Map<String, dynamic>.from(json);

//     // Ensure product field is deserialized properly
//     if (formattedJson['product'] is Map<String, dynamic>) {
//       formattedJson['product'] =
//           Product.fromJson(Map<String, dynamic>.from(formattedJson['product']));
//     } else {
//       // Provide a fallback Product to prevent null issues
//       formattedJson['product'] = Product(
// id: "default_id",
// productName: "Unknown Product",
// productShortDesc: '',
// productDesc: '',
// productPrice: null,
// productSalePrice: null,
// productSKU: null,
// productType: '',
// productStatus: '',
// stockStatus: '',
// productImage: '',
// productId: '',
//       );
//     }

//     return _$CartproductFromJson(formattedJson);
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'product.dart';

part 'cart_product.freezed.dart';
part 'cart_product.g.dart';

@freezed
class Cartproduct with _$Cartproduct {
  factory Cartproduct({
    required double qty,
    required Product product, // Make product required
  }) = _Cartproduct;

  factory Cartproduct.fromJson(Map<String, dynamic> json) =>
      _$CartproductFromJson(json);
}
