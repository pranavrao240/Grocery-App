// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @JsonKey(name: '_id')
  String? get productId => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  String? get productShortDesc => throw _privateConstructorUsedError;
  String? get productDesc => throw _privateConstructorUsedError;
  double? get productPrice => throw _privateConstructorUsedError;
  double? get productSalePrice => throw _privateConstructorUsedError;
  double? get productSKU => throw _privateConstructorUsedError;
  String? get productType => throw _privateConstructorUsedError;
  String? get productStatus => throw _privateConstructorUsedError;
  String? get stockStatus => throw _privateConstructorUsedError;
  String? get productImage => throw _privateConstructorUsedError;
  List<String>? get relatedProducts => throw _privateConstructorUsedError;
  bool? get favourite => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
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
      bool? favourite});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? productName = freezed,
    Object? productShortDesc = freezed,
    Object? productDesc = freezed,
    Object? productPrice = freezed,
    Object? productSalePrice = freezed,
    Object? productSKU = freezed,
    Object? productType = freezed,
    Object? productStatus = freezed,
    Object? stockStatus = freezed,
    Object? productImage = freezed,
    Object? relatedProducts = freezed,
    Object? favourite = freezed,
  }) {
    return _then(_value.copyWith(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productShortDesc: freezed == productShortDesc
          ? _value.productShortDesc
          : productShortDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      productDesc: freezed == productDesc
          ? _value.productDesc
          : productDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      productPrice: freezed == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      productSalePrice: freezed == productSalePrice
          ? _value.productSalePrice
          : productSalePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      productSKU: freezed == productSKU
          ? _value.productSKU
          : productSKU // ignore: cast_nullable_to_non_nullable
              as double?,
      productType: freezed == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String?,
      productStatus: freezed == productStatus
          ? _value.productStatus
          : productStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      stockStatus: freezed == stockStatus
          ? _value.stockStatus
          : stockStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      productImage: freezed == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedProducts: freezed == relatedProducts
          ? _value.relatedProducts
          : relatedProducts // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      favourite: freezed == favourite
          ? _value.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
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
      bool? favourite});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? productName = freezed,
    Object? productShortDesc = freezed,
    Object? productDesc = freezed,
    Object? productPrice = freezed,
    Object? productSalePrice = freezed,
    Object? productSKU = freezed,
    Object? productType = freezed,
    Object? productStatus = freezed,
    Object? stockStatus = freezed,
    Object? productImage = freezed,
    Object? relatedProducts = freezed,
    Object? favourite = freezed,
  }) {
    return _then(_$ProductImpl(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productShortDesc: freezed == productShortDesc
          ? _value.productShortDesc
          : productShortDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      productDesc: freezed == productDesc
          ? _value.productDesc
          : productDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      productPrice: freezed == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      productSalePrice: freezed == productSalePrice
          ? _value.productSalePrice
          : productSalePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      productSKU: freezed == productSKU
          ? _value.productSKU
          : productSKU // ignore: cast_nullable_to_non_nullable
              as double?,
      productType: freezed == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String?,
      productStatus: freezed == productStatus
          ? _value.productStatus
          : productStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      stockStatus: freezed == stockStatus
          ? _value.stockStatus
          : stockStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      productImage: freezed == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedProducts: freezed == relatedProducts
          ? _value._relatedProducts
          : relatedProducts // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      favourite: freezed == favourite
          ? _value.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {@JsonKey(name: '_id') this.productId,
      this.productName,
      this.productShortDesc,
      this.productDesc,
      this.productPrice,
      this.productSalePrice,
      this.productSKU,
      this.productType,
      this.productStatus,
      this.stockStatus,
      this.productImage,
      final List<String>? relatedProducts,
      this.favourite = false})
      : _relatedProducts = relatedProducts;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? productId;
  @override
  final String? productName;
  @override
  final String? productShortDesc;
  @override
  final String? productDesc;
  @override
  final double? productPrice;
  @override
  final double? productSalePrice;
  @override
  final double? productSKU;
  @override
  final String? productType;
  @override
  final String? productStatus;
  @override
  final String? stockStatus;
  @override
  final String? productImage;
  final List<String>? _relatedProducts;
  @override
  List<String>? get relatedProducts {
    final value = _relatedProducts;
    if (value == null) return null;
    if (_relatedProducts is EqualUnmodifiableListView) return _relatedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool? favourite;

  @override
  String toString() {
    return 'Product(productId: $productId, productName: $productName, productShortDesc: $productShortDesc, productDesc: $productDesc, productPrice: $productPrice, productSalePrice: $productSalePrice, productSKU: $productSKU, productType: $productType, productStatus: $productStatus, stockStatus: $stockStatus, productImage: $productImage, relatedProducts: $relatedProducts, favourite: $favourite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productShortDesc, productShortDesc) ||
                other.productShortDesc == productShortDesc) &&
            (identical(other.productDesc, productDesc) ||
                other.productDesc == productDesc) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.productSalePrice, productSalePrice) ||
                other.productSalePrice == productSalePrice) &&
            (identical(other.productSKU, productSKU) ||
                other.productSKU == productSKU) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.productStatus, productStatus) ||
                other.productStatus == productStatus) &&
            (identical(other.stockStatus, stockStatus) ||
                other.stockStatus == stockStatus) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            const DeepCollectionEquality()
                .equals(other._relatedProducts, _relatedProducts) &&
            (identical(other.favourite, favourite) ||
                other.favourite == favourite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productId,
      productName,
      productShortDesc,
      productDesc,
      productPrice,
      productSalePrice,
      productSKU,
      productType,
      productStatus,
      stockStatus,
      productImage,
      const DeepCollectionEquality().hash(_relatedProducts),
      favourite);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {@JsonKey(name: '_id') final String? productId,
      final String? productName,
      final String? productShortDesc,
      final String? productDesc,
      final double? productPrice,
      final double? productSalePrice,
      final double? productSKU,
      final String? productType,
      final String? productStatus,
      final String? stockStatus,
      final String? productImage,
      final List<String>? relatedProducts,
      final bool? favourite}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get productId;
  @override
  String? get productName;
  @override
  String? get productShortDesc;
  @override
  String? get productDesc;
  @override
  double? get productPrice;
  @override
  double? get productSalePrice;
  @override
  double? get productSKU;
  @override
  String? get productType;
  @override
  String? get productStatus;
  @override
  String? get stockStatus;
  @override
  String? get productImage;
  @override
  List<String>? get relatedProducts;
  @override
  bool? get favourite;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
