import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/models/pagination.dart';
part 'productFilter.freezed.dart';

@freezed
abstract class ProductFilterModel with _$ProductFilterModel {
  factory ProductFilterModel({
    required PaginationModel paginationModel,
    String? categoryId,
    String? sortBy,
    List<String>? productIds,
  }) = _ProductFilterModel;
}
