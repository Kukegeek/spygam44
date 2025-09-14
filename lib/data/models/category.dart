import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
@HiveType(typeId: 3)
class CategoryTranslations with _$CategoryTranslations {
  const factory CategoryTranslations({
    @HiveField(0) required String es,
    @HiveField(1) required String en,
    @HiveField(2) required String it,
    @HiveField(3) required String fr,
    @HiveField(4) required String de,
    @HiveField(5) required String pt,
  }) = _CategoryTranslations;

  factory CategoryTranslations.fromJson(Map<String, dynamic> json) =>
      _$CategoryTranslationsFromJson(json);
}

@freezed
@HiveType(typeId: 4)
class CategoryMeanings with _$CategoryMeanings {
  const factory CategoryMeanings({
    @HiveField(0) required String es,
    @HiveField(1) required String en,
    @HiveField(2) required String it,
    @HiveField(3) required String fr,
    @HiveField(4) required String de,
    @HiveField(5) required String pt,
  }) = _CategoryMeanings;

  factory CategoryMeanings.fromJson(Map<String, dynamic> json) =>
      _$CategoryMeaningsFromJson(json);
}

@freezed
@HiveType(typeId: 5)
class Category with _$Category {
  const Category._();

  const factory Category({
    @HiveField(0) required int idGroup,
    @HiveField(1) required CategoryTranslations categories,
    @HiveField(2) required CategoryMeanings meanings,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  String getCategoryByLanguage(String language) {
    switch (language.toLowerCase()) {
      case 'es':
        return categories.es;
      case 'en':
        return categories.en;
      case 'it':
        return categories.it;
      case 'fr':
        return categories.fr;
      case 'de':
        return categories.de;
      case 'pt':
        return categories.pt;
      default:
        return categories.en;
    }
  }

  String getMeaningByLanguage(String language) {
    switch (language.toLowerCase()) {
      case 'es':
        return meanings.es;
      case 'en':
        return meanings.en;
      case 'it':
        return meanings.it;
      case 'fr':
        return meanings.fr;
      case 'de':
        return meanings.de;
      case 'pt':
        return meanings.pt;
      default:
        return meanings.en;
    }
  }
}

// Remove extension - methods are now part of class
