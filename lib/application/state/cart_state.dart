import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/models/cart.dart';
part 'cart_state.freezed.dart';

// @freezed
// class CartState with _$CartState {
//   const factory CartState({Cart? cartModel, @Default(false) bool isLoading}) =
//       _CartState;
// }

@freezed
class CartState with _$CartState {
  const factory CartState({
    Cart? cartModel,
    @Default(false) bool isLoading,
    @Default('') String error, // ✅ Added error field
  }) = _CartState;
}
