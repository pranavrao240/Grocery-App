// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderPayment _$OrderPaymentFromJson(Map<String, dynamic> json) {
  return _OrderPayment.fromJson(json);
}

/// @nodoc
mixin _$OrderPayment {
  String get stripeCustomerID => throw _privateConstructorUsedError;
  String get cardID => throw _privateConstructorUsedError;
  String get paymentIntentID => throw _privateConstructorUsedError;
  String get orderID => throw _privateConstructorUsedError;
  String get client_secret => throw _privateConstructorUsedError;

  /// Serializes this OrderPayment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderPaymentCopyWith<OrderPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPaymentCopyWith<$Res> {
  factory $OrderPaymentCopyWith(
          OrderPayment value, $Res Function(OrderPayment) then) =
      _$OrderPaymentCopyWithImpl<$Res, OrderPayment>;
  @useResult
  $Res call(
      {String stripeCustomerID,
      String cardID,
      String paymentIntentID,
      String orderID,
      String client_secret});
}

/// @nodoc
class _$OrderPaymentCopyWithImpl<$Res, $Val extends OrderPayment>
    implements $OrderPaymentCopyWith<$Res> {
  _$OrderPaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stripeCustomerID = null,
    Object? cardID = null,
    Object? paymentIntentID = null,
    Object? orderID = null,
    Object? client_secret = null,
  }) {
    return _then(_value.copyWith(
      stripeCustomerID: null == stripeCustomerID
          ? _value.stripeCustomerID
          : stripeCustomerID // ignore: cast_nullable_to_non_nullable
              as String,
      cardID: null == cardID
          ? _value.cardID
          : cardID // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIntentID: null == paymentIntentID
          ? _value.paymentIntentID
          : paymentIntentID // ignore: cast_nullable_to_non_nullable
              as String,
      orderID: null == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      client_secret: null == client_secret
          ? _value.client_secret
          : client_secret // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderPaymentImplCopyWith<$Res>
    implements $OrderPaymentCopyWith<$Res> {
  factory _$$OrderPaymentImplCopyWith(
          _$OrderPaymentImpl value, $Res Function(_$OrderPaymentImpl) then) =
      __$$OrderPaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stripeCustomerID,
      String cardID,
      String paymentIntentID,
      String orderID,
      String client_secret});
}

/// @nodoc
class __$$OrderPaymentImplCopyWithImpl<$Res>
    extends _$OrderPaymentCopyWithImpl<$Res, _$OrderPaymentImpl>
    implements _$$OrderPaymentImplCopyWith<$Res> {
  __$$OrderPaymentImplCopyWithImpl(
      _$OrderPaymentImpl _value, $Res Function(_$OrderPaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stripeCustomerID = null,
    Object? cardID = null,
    Object? paymentIntentID = null,
    Object? orderID = null,
    Object? client_secret = null,
  }) {
    return _then(_$OrderPaymentImpl(
      stripeCustomerID: null == stripeCustomerID
          ? _value.stripeCustomerID
          : stripeCustomerID // ignore: cast_nullable_to_non_nullable
              as String,
      cardID: null == cardID
          ? _value.cardID
          : cardID // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIntentID: null == paymentIntentID
          ? _value.paymentIntentID
          : paymentIntentID // ignore: cast_nullable_to_non_nullable
              as String,
      orderID: null == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      client_secret: null == client_secret
          ? _value.client_secret
          : client_secret // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderPaymentImpl implements _OrderPayment {
  _$OrderPaymentImpl(
      {required this.stripeCustomerID,
      required this.cardID,
      required this.paymentIntentID,
      required this.orderID,
      required this.client_secret});

  factory _$OrderPaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderPaymentImplFromJson(json);

  @override
  final String stripeCustomerID;
  @override
  final String cardID;
  @override
  final String paymentIntentID;
  @override
  final String orderID;
  @override
  final String client_secret;

  @override
  String toString() {
    return 'OrderPayment(stripeCustomerID: $stripeCustomerID, cardID: $cardID, paymentIntentID: $paymentIntentID, orderID: $orderID, client_secret: $client_secret)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderPaymentImpl &&
            (identical(other.stripeCustomerID, stripeCustomerID) ||
                other.stripeCustomerID == stripeCustomerID) &&
            (identical(other.cardID, cardID) || other.cardID == cardID) &&
            (identical(other.paymentIntentID, paymentIntentID) ||
                other.paymentIntentID == paymentIntentID) &&
            (identical(other.orderID, orderID) || other.orderID == orderID) &&
            (identical(other.client_secret, client_secret) ||
                other.client_secret == client_secret));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, stripeCustomerID, cardID,
      paymentIntentID, orderID, client_secret);

  /// Create a copy of OrderPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderPaymentImplCopyWith<_$OrderPaymentImpl> get copyWith =>
      __$$OrderPaymentImplCopyWithImpl<_$OrderPaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderPaymentImplToJson(
      this,
    );
  }
}

abstract class _OrderPayment implements OrderPayment {
  factory _OrderPayment(
      {required final String stripeCustomerID,
      required final String cardID,
      required final String paymentIntentID,
      required final String orderID,
      required final String client_secret}) = _$OrderPaymentImpl;

  factory _OrderPayment.fromJson(Map<String, dynamic> json) =
      _$OrderPaymentImpl.fromJson;

  @override
  String get stripeCustomerID;
  @override
  String get cardID;
  @override
  String get paymentIntentID;
  @override
  String get orderID;
  @override
  String get client_secret;

  /// Create a copy of OrderPayment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderPaymentImplCopyWith<_$OrderPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
