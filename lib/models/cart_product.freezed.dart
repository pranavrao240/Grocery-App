// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cartproduct _$CartproductFromJson(Map<String, dynamic> json) {
  return _Cartproduct.fromJson(json);
}

/// @nodoc
mixin _$Cartproduct {
  double get qty => throw _privateConstructorUsedError;
  Product get product => throw _privateConstructorUsedError;

  /// Serializes this Cartproduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Cartproduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartproductCopyWith<Cartproduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartproductCopyWith<$Res> {
  factory $CartproductCopyWith(
          Cartproduct value, $Res Function(Cartproduct) then) =
      _$CartproductCopyWithImpl<$Res, Cartproduct>;
  @useResult
  $Res call({double qty, Product product});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$CartproductCopyWithImpl<$Res, $Val extends Cartproduct>
    implements $CartproductCopyWith<$Res> {
  _$CartproductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Cartproduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
    Object? product = null,
  }) {
    return _then(_value.copyWith(
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ) as $Val);
  }

  /// Create a copy of Cartproduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartproductImplCopyWith<$Res>
    implements $CartproductCopyWith<$Res> {
  factory _$$CartproductImplCopyWith(
          _$CartproductImpl value, $Res Function(_$CartproductImpl) then) =
      __$$CartproductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double qty, Product product});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$CartproductImplCopyWithImpl<$Res>
    extends _$CartproductCopyWithImpl<$Res, _$CartproductImpl>
    implements _$$CartproductImplCopyWith<$Res> {
  __$$CartproductImplCopyWithImpl(
      _$CartproductImpl _value, $Res Function(_$CartproductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Cartproduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
    Object? product = null,
  }) {
    return _then(_$CartproductImpl(
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartproductImpl implements _Cartproduct {
  _$CartproductImpl({required this.qty, required this.product});

  factory _$CartproductImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartproductImplFromJson(json);

  @override
  final double qty;
  @override
  final Product product;

  @override
  String toString() {
    return 'Cartproduct(qty: $qty, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartproductImpl &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, qty, product);

  /// Create a copy of Cartproduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartproductImplCopyWith<_$CartproductImpl> get copyWith =>
      __$$CartproductImplCopyWithImpl<_$CartproductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartproductImplToJson(
      this,
    );
  }
}

abstract class _Cartproduct implements Cartproduct {
  factory _Cartproduct(
      {required final double qty,
      required final Product product}) = _$CartproductImpl;

  factory _Cartproduct.fromJson(Map<String, dynamic> json) =
      _$CartproductImpl.fromJson;

  @override
  double get qty;
  @override
  Product get product;

  /// Create a copy of Cartproduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartproductImplCopyWith<_$CartproductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
