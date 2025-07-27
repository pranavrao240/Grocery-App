// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) {
  return _Slider.fromJson(json);
}

/// @nodoc
mixin _$SliderModel {
  String get sliderName => throw _privateConstructorUsedError;
  String get sliderImage => throw _privateConstructorUsedError;
  String get sliderDesc => throw _privateConstructorUsedError;

  /// Serializes this SliderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SliderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SliderModelCopyWith<SliderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SliderModelCopyWith<$Res> {
  factory $SliderModelCopyWith(
          SliderModel value, $Res Function(SliderModel) then) =
      _$SliderModelCopyWithImpl<$Res, SliderModel>;
  @useResult
  $Res call({String sliderName, String sliderImage, String sliderDesc});
}

/// @nodoc
class _$SliderModelCopyWithImpl<$Res, $Val extends SliderModel>
    implements $SliderModelCopyWith<$Res> {
  _$SliderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SliderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sliderName = null,
    Object? sliderImage = null,
    Object? sliderDesc = null,
  }) {
    return _then(_value.copyWith(
      sliderName: null == sliderName
          ? _value.sliderName
          : sliderName // ignore: cast_nullable_to_non_nullable
              as String,
      sliderImage: null == sliderImage
          ? _value.sliderImage
          : sliderImage // ignore: cast_nullable_to_non_nullable
              as String,
      sliderDesc: null == sliderDesc
          ? _value.sliderDesc
          : sliderDesc // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SliderImplCopyWith<$Res>
    implements $SliderModelCopyWith<$Res> {
  factory _$$SliderImplCopyWith(
          _$SliderImpl value, $Res Function(_$SliderImpl) then) =
      __$$SliderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sliderName, String sliderImage, String sliderDesc});
}

/// @nodoc
class __$$SliderImplCopyWithImpl<$Res>
    extends _$SliderModelCopyWithImpl<$Res, _$SliderImpl>
    implements _$$SliderImplCopyWith<$Res> {
  __$$SliderImplCopyWithImpl(
      _$SliderImpl _value, $Res Function(_$SliderImpl) _then)
      : super(_value, _then);

  /// Create a copy of SliderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sliderName = null,
    Object? sliderImage = null,
    Object? sliderDesc = null,
  }) {
    return _then(_$SliderImpl(
      sliderName: null == sliderName
          ? _value.sliderName
          : sliderName // ignore: cast_nullable_to_non_nullable
              as String,
      sliderImage: null == sliderImage
          ? _value.sliderImage
          : sliderImage // ignore: cast_nullable_to_non_nullable
              as String,
      sliderDesc: null == sliderDesc
          ? _value.sliderDesc
          : sliderDesc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SliderImpl implements _Slider {
  _$SliderImpl(
      {required this.sliderName,
      required this.sliderImage,
      required this.sliderDesc});

  factory _$SliderImpl.fromJson(Map<String, dynamic> json) =>
      _$$SliderImplFromJson(json);

  @override
  final String sliderName;
  @override
  final String sliderImage;
  @override
  final String sliderDesc;

  @override
  String toString() {
    return 'SliderModel(sliderName: $sliderName, sliderImage: $sliderImage, sliderDesc: $sliderDesc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SliderImpl &&
            (identical(other.sliderName, sliderName) ||
                other.sliderName == sliderName) &&
            (identical(other.sliderImage, sliderImage) ||
                other.sliderImage == sliderImage) &&
            (identical(other.sliderDesc, sliderDesc) ||
                other.sliderDesc == sliderDesc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sliderName, sliderImage, sliderDesc);

  /// Create a copy of SliderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SliderImplCopyWith<_$SliderImpl> get copyWith =>
      __$$SliderImplCopyWithImpl<_$SliderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SliderImplToJson(
      this,
    );
  }
}

abstract class _Slider implements SliderModel {
  factory _Slider(
      {required final String sliderName,
      required final String sliderImage,
      required final String sliderDesc}) = _$SliderImpl;

  factory _Slider.fromJson(Map<String, dynamic> json) = _$SliderImpl.fromJson;

  @override
  String get sliderName;
  @override
  String get sliderImage;
  @override
  String get sliderDesc;

  /// Create a copy of SliderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SliderImplCopyWith<_$SliderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
