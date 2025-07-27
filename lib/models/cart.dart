import 'package:freezed_annotation/freezed_annotation.dart';
import 'cart_product.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
abstract class Cart with _$Cart {
  @JsonSerializable(explicitToJson: true)
  factory Cart({
    @Default('Unknown') String userId,
    @Default([]) List<Cartproduct> products,
    @Default('Unknown') String cartId,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

extension CartExt on Cart {
  double get grandTotal {
    return products
        .map((e) =>
            e.product.productSalePrice! * e.qty) // Use productSalePrice and qty
        .fold(0.0, (p, c) => p + c);
  }
}
