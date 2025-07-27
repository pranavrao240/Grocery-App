import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/config.dart';
part 'category.freezed.dart';
part 'category.g.dart';

// List<Category> categoriesFromJson(dynamic str) =>
//     List<Category>.from((str).map((e) => Category.fromJson(e)));

List<Category> categoriesFromJson(List<dynamic> json) {
  return json.map((e) {
    return Category.fromJson({
      'categoryName': e['categoryName'] ?? '',
      'categoryImage': e['categoryImage'] ?? '',
      'categoryId': e['_id'] ?? '',
    });
  }).toList();
}

@freezed
abstract class Category with _$Category {
  const factory Category({
    required String categoryName,
    required String categoryImage,
    required String categoryId,
  }) = _Category;
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

extension CategoryExt on Category {
  String get fullImagePath => Config.imageUrl + categoryImage;
}
